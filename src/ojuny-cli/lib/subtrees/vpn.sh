vpn_subtree() {
    local command="${1:-}"
    shift || true

    case "$command" in
    status)
        ojuny_require_command wg
        wg show
        ;;
    list)
        local file
        for file in /etc/wireguard/*.conf; do
            [ -e "$file" ] || continue
            basename "$file" .conf
        done
        ;;
    up)
        if [ "$#" -lt 1 ]; then
            ojuny_err "usage: ojuny vpn up <interface>"
            return "$OJUNY_EXIT_USAGE"
        fi
        ojuny_require_command wg-quick
        wg-quick up "$1"
        ;;
    down)
        if [ "$#" -lt 1 ]; then
            ojuny_err "usage: ojuny vpn down <interface>"
            return "$OJUNY_EXIT_USAGE"
        fi
        ojuny_require_command wg-quick
        wg-quick down "$1"
        ;;
    *)
        ojuny_err "usage: ojuny vpn <status|list|up|down>"
        return "$OJUNY_EXIT_USAGE"
        ;;
    esac
}
