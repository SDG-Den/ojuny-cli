toggle_subtree() {
    case "${1:-}" in
    night)
        dms_night_toggle
        ;;
    idle)
        dms_inhibit_toggle
        ;;
    sleep)
        system_suspend
        ;;
    lockscreen | screensaver)
        system_lock
        ;;
    dnd)
        dms_dnd_toggle
        ;;
    *)
        ojuny_err "usage: ojuny toggle <night|idle|sleep|lockscreen|screensaver|dnd>"
        return "$OJUNY_EXIT_USAGE"
        ;;
    esac
}
