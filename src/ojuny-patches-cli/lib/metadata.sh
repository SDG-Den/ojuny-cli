patches_id_valid() {
    case "$1" in
    patch-*) ;;
    *) return 1 ;;
    esac
    printf '%s' "$1" | grep -Eq '^patch-[a-z0-9]+(-[a-z0-9]+)*$'
}

patches_metadata_file() {
    printf '%s/%s/metadata.md\n' "$1" "$2"
}

patches_patch_file() {
    printf '%s/modules/patches/%s.nix\n' "$1" "$2"
}

patches_metadata_get() {
    local file="$1"
    local key="$2"

    [ -r "$file" ] || return 1

    awk -v key="$key" '
        BEGIN { IGNORECASE = 1 }
        {
            line = $0
            sub(/^[[:space:]]*/, "", line)
            if (index(tolower(line), tolower(key) ":") == 1) {
                sub(/^[^:]*:[[:space:]]*/, "", line)
                sub(/[[:space:]]*$/, "", line)
                print line
                exit
            }
        }
    ' "$file"
}

patches_metadata_dependencies() {
    local value dep

    value="$(patches_metadata_get "$1" dependencies)"
    printf '%s\n' "$value" | tr ',' '\n' | while IFS= read -r dep; do
        dep="$(ojuny_trim "$dep")"
        [ -n "$dep" ] && printf '%s\n' "$dep"
    done
}

patches_metadata_validate() {
    local file="$1"
    local id="$2"
    local key value

    [ -r "$file" ] || {
        ojuny_err "missing metadata: $file"
        return "$OJUNY_EXIT_VALIDATION"
    }

    for key in name description version; do
        value="$(patches_metadata_get "$file" "$key")"
        if [ -z "$value" ]; then
            ojuny_err "missing metadata key '$key' in $file"
            return "$OJUNY_EXIT_VALIDATION"
        fi
    done

    value="$(patches_metadata_get "$file" id)"
    if [ "$value" != "$id" ]; then
        ojuny_err "metadata id '$value' does not match '$id'"
        return "$OJUNY_EXIT_VALIDATION"
    fi
}

patches_find_repos() {
    local id="$1"
    local url dir found=0

    patches_ensure_repos_file

    while IFS= read -r url; do
        [ -n "$url" ] || continue
        dir="$(patches_cache_repo_dir "$url")"
        if [ -f "$(patches_patch_file "$dir" "$id")" ] &&
            [ -f "$(patches_metadata_file "$dir" "$id")" ]; then
            printf '%s\n' "$dir"
            found=1
        fi
    done <"$(patches_repos_file)"

    [ "$found" -eq 1 ]
}

patches_repo_commit() {
    git -C "$1" rev-parse --short HEAD 2>/dev/null || printf 'unknown\n'
}

patches_repo_label() {
    basename "$1"
}
