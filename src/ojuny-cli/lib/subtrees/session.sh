session_subtree() {
    case "${1:-}" in
    quit)
        session_quit
        ;;
    restart)
        session_restart
        ;;
    *)
        ojuny_err "usage: ojuny session <quit|restart>"
        return "$OJUNY_EXIT_USAGE"
        ;;
    esac
}
