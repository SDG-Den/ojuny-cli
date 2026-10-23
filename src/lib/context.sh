ojuny_flake_context() {
    local result="${1:-ok}"
    local flake host branch revision dirty nix_version metadata inputs

    flake="$(ojuny_flake_root)" || return
    host="$(ojuny_host_name 2>/dev/null || true)"
    [ -n "$host" ] || host="unknown"

    branch="$(ojuny_git_branch "$flake")"
    revision="$(ojuny_git_revision "$flake")"
    dirty="$(ojuny_git_dirty "$flake")"
    nix_version="$(nix --version 2>/dev/null | awk '{print $3}')"
    metadata="$(nix flake metadata --json "$flake" 2>/dev/null || true)"

    inputs="unknown"
    if [ -n "$metadata" ]; then
        inputs="$(printf '%s' "$metadata" |
            jq -r '. as $meta | $meta.locks.nodes.root.inputs | to_entries[] | .key as $name | .value as $node | "\($name) \($meta.locks.nodes[$node].locked.rev[0:7] // "unknown")"' 2>/dev/null |
            paste -sd, - || true)"
        [ -n "$inputs" ] || inputs="none"
    fi

    printf 'ojuny flake context\n'
    printf '  flake:  %s\n' "$flake"
    printf '  host:   %s\n' "$host"
    printf '  git:    %s @ %s (%s)\n' "$branch" "$revision" "$dirty"
    printf '  nix:    %s\n' "${nix_version:-unknown}"
    printf '  inputs: %s\n' "$inputs"
    printf '  result: %s\n' "$result"
}

ojuny_flake_result() {
    if [ "$1" -eq 0 ]; then
        printf '  result: ok\n'
    else
        printf '  result: failed\n'
    fi
}

ojuny_print_patch_state() {
    local flake host enabled names kind values

    flake="$(ojuny_flake_root)" || return
    host="$(ojuny_host_name)" || return

    enabled="$(nix eval --json "$flake#nixosConfigurations.$host.config.ojuny.patches" 2>/dev/null || true)"
    case "$enabled" in
    true) printf '  patches: enabled\n' ;;
    false) printf '  patches: disabled\n' ;;
    *)
        printf '  patches: unknown\n'
        return 1
        ;;
    esac

    values=""
    for kind in nixos homeManager; do
        names="$(nix eval --json "$flake#modules.$kind" --apply 'builtins.attrNames' 2>/dev/null || true)"
        if [ -n "$names" ]; then
            values+="$(printf '%s' "$names" | jq -r '.[] | select(startswith("patch-"))' 2>/dev/null || true)"$'\n'
        fi
    done

    names="$(printf '%s' "$values" | grep -v '^$' | sort -u | paste -sd, -)"
    printf '  available: %s\n' "${names:-none}"
}
