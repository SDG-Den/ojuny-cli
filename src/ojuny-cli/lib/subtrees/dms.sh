dms_subtree() {
    local command="${1:-}"
    shift || true

    case "$command" in
    start)
        dms_start
        ;;
    stop)
        dms_stop
        ;;
    restart)
        dms_restart
        ;;
    status)
        dms_status
        ;;
    ipc)
        dms_ipc "$@"
        ;;
    *)
        ojuny_err "usage: ojuny dms <start|stop|restart|status|ipc>"
        return "$OJUNY_EXIT_USAGE"
        ;;
    esac
}
