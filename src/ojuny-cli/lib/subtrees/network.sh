network_subtree() {
    local command="${1:-}"
    shift || true

    case "$command" in
    open)
        network_open
        ;;
    status)
        network_status
        ;;
    list)
        network_list
        ;;
    connect)
        if [ "$#" -lt 1 ]; then
            ojuny_err "usage: ojuny network connect <name>"
            return "$OJUNY_EXIT_USAGE"
        fi
        network_connect "$1"
        ;;
    disconnect)
        if [ "$#" -lt 1 ]; then
            ojuny_err "usage: ojuny network disconnect <device>"
            return "$OJUNY_EXIT_USAGE"
        fi
        network_disconnect "$1"
        ;;
    enable)
        network_enable
        ;;
    disable)
        network_disable
        ;;
    *)
        ojuny_err "usage: ojuny network <open|status|list|connect|disconnect|enable|disable>"
        return "$OJUNY_EXIT_USAGE"
        ;;
    esac
}
