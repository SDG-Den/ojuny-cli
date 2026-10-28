toggle_subtree() {
    case "${1:-}" in
    night)
        dux_night_toggle
        ;;
    idle)
        dux_inhibit_toggle
        ;;
    sleep)
        system_suspend
        ;;
    lockscreen | screensaver)
        system_lock
        ;;
    dnd)
        dux_dnd_toggle
        ;;
    *)
        ojuny_err "usage: ojuny toggle <night|idle|sleep|lockscreen|screensaver|dnd>"
        return "$OJUNY_EXIT_USAGE"
        ;;
    esac
}
