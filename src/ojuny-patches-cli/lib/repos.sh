patches_repo_list() {
    patches_ensure_repos_file
    cat "$(patches_repos_file)"
}

patches_repo_add() {
    local url="${1:-}"
    local file

    [ -n "$url" ] || {
        ojuny_err "usage: ojuny-patches repo add <url>"
        return "$OJUNY_EXIT_USAGE"
    }
    case "$url" in
    *[[:space:]]*)
        ojuny_err "repository URL must not contain whitespace"
        return "$OJUNY_EXIT_USAGE"
        ;;
    esac

    patches_ensure_repos_file
    file="$(patches_repos_file)"
    if grep -Fxq "$url" "$file"; then
        ojuny_err "repository already exists: $url"
        return "$OJUNY_EXIT_CONFLICT"
    fi

    printf '%s\n' "$url" >>"$file"
    printf 'added %s\n' "$url"
}

patches_repo_remove() {
    local url="${1:-}"
    local file tmp dir

    [ -n "$url" ] || {
        ojuny_err "usage: ojuny-patches repo remove <url>"
        return "$OJUNY_EXIT_USAGE"
    }

    patches_ensure_repos_file
    file="$(patches_repos_file)"
    if ! grep -Fxq "$url" "$file"; then
        ojuny_err "repository not found: $url"
        return "$OJUNY_EXIT_VALIDATION"
    fi

    ojuny_confirm "Remove repository $url and its cache?" || return 1

    tmp="$(mktemp)"
    grep -Fxv "$url" "$file" >"$tmp" || true
    mv "$tmp" "$file"

    dir="$(patches_cache_repo_dir "$url")"
    if [ -e "$dir" ]; then
        rm -rf -- "$dir"
    fi

    printf 'removed %s\n' "$url"
}

patches_selected_repos() {
    local target="${1:-}"
    local url found=0

    patches_ensure_repos_file

    while IFS= read -r url; do
        [ -n "$url" ] || continue
        if [ -z "$target" ] ||
            [ "$url" = "$target" ] ||
            [ "$(ojuny_repo_name_from_url "$url")" = "$target" ]; then
            printf '%s\n' "$url"
            found=1
        fi
    done <"$(patches_repos_file)"

    if [ "$found" -eq 0 ]; then
        ojuny_err "repository not found: $target"
        return "$OJUNY_EXIT_VALIDATION"
    fi
}

patches_sync_one() {
    local url="$1"
    local dir

    dir="$(patches_cache_repo_dir "$url")"

    if [ -d "$dir/.git" ]; then
        printf 'pulling %s\n' "$(ojuny_repo_name_from_url "$url")"
        git -C "$dir" pull --ff-only
    elif [ -e "$dir" ]; then
        ojuny_err "cache path is not a git repository: $dir"
        return "$OJUNY_EXIT_VALIDATION"
    else
        printf 'cloning %s\n' "$url"
        git clone "$url" "$dir"
    fi
}

patches_sync() {
    local target="${1:-}"
    local selected lock

    ojuny_require_command git
    ojuny_require_command flock
    patches_ensure_repos_file
    patches_cache_init

    selected="$(patches_selected_repos "$target")" || return
    lock="$(patches_cache_lock)"

    (
        flock -x 9
        while IFS= read -r url; do
            [ -n "$url" ] || continue
            patches_sync_one "$url" || exit $?
        done <<<"$selected"
    ) 9>"$lock"
}
