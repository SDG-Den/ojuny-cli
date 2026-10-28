dux_subtree() {
    local command="${1:-}"
    shift || true

    case "$command" in
    start)
        dux_start
        ;;
    stop)
        dux_stop
        ;;
    restart)
        dux_restart
        ;;
    status)
        dux_status
        ;;
    ipc)
        dux_ipc "$@"
        ;;
    *)
        ojuny_err "usage: ojuny dux <start|stop|restart|status|ipc>"
        return "$OJUNY_EXIT_USAGE"
        ;;
    esac
}
