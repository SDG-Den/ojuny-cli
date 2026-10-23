doctor_subtree() {
    local status=0
    local flake=""
    local host=""
    local command

    if flake="$(ojuny_flake_root)"; then
        printf 'flake: %s\n' "$flake"
    else
        printf 'flake: unknown\n'
        status=1
    fi

    if [ -n "$flake" ]; then
        if host="$(ojuny_host_name)"; then
            printf 'host: %s\n' "$host"
        else
            printf 'host: unknown\n'
            status=1
        fi
    else
        printf 'host: unknown\n'
    fi

    for command in mmsg dms nmcli bluetoothctl wpctl playerctl wg wg-quick nix git jq; do
        if command -v "$command" >/dev/null 2>&1; then
            printf 'ok: %s\n' "$command"
        else
            printf 'missing: %s\n' "$command"
            status=1
        fi
    done

    if [ -n "$flake" ] && [ -n "$host" ]; then
        ojuny_print_patch_state || status=1
    else
        printf '  patches: unknown\n'
    fi

    return "$status"
}
