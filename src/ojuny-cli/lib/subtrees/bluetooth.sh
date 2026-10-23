bluetooth_subtree() {
    local command="${1:-}"
    shift || true

    case "$command" in
    open)
        bluetooth_open
        ;;
    status)
        bluetooth_status
        ;;
    list)
        bluetooth_list
        ;;
    scan)
        if [ "$#" -lt 1 ]; then
            ojuny_err "usage: ojuny bluetooth scan <on|off>"
            return "$OJUNY_EXIT_USAGE"
        fi
        bluetooth_scan "$1"
        ;;
    power)
        if [ "$#" -lt 1 ]; then
            ojuny_err "usage: ojuny bluetooth power <on|off>"
            return "$OJUNY_EXIT_USAGE"
        fi
        bluetooth_power "$1"
        ;;
    connect)
        if [ "$#" -lt 1 ]; then
            ojuny_err "usage: ojuny bluetooth connect <mac>"
            return "$OJUNY_EXIT_USAGE"
        fi
        bluetooth_connect "$1"
        ;;
    disconnect)
        if [ "$#" -lt 1 ]; then
            ojuny_err "usage: ojuny bluetooth disconnect <mac>"
            return "$OJUNY_EXIT_USAGE"
        fi
        bluetooth_disconnect "$1"
        ;;
    *)
        ojuny_err "usage: ojuny bluetooth <open|status|list|scan|power|connect|disconnect>"
        return "$OJUNY_EXIT_USAGE"
        ;;
    esac
}
