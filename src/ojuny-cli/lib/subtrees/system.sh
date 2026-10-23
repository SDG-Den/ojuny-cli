system_subtree() {
    case "${1:-}" in
    lock)
        system_lock
        ;;
    logout)
        system_logout
        ;;
    suspend)
        system_suspend
        ;;
    hibernate)
        system_hibernate
        ;;
    reboot)
        system_reboot
        ;;
    shutdown)
        system_shutdown
        ;;
    *)
        ojuny_err "usage: ojuny system <lock|logout|suspend|hibernate|reboot|shutdown>"
        return "$OJUNY_EXIT_USAGE"
        ;;
    esac
}
