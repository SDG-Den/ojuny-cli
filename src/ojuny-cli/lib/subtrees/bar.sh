bar_subtree() {
    case "${1:-}" in
    toggle)
        dms_bar_toggle
        ;;
    show)
        dms_call bar show
        ;;
    hide)
        dms_call bar hide
        ;;
    preset | autohide | move)
        ojuny_err "persistent setting; use 'ojuny settings open bar'"
        return "$OJUNY_EXIT_VALIDATION"
        ;;
    *)
        ojuny_err "usage: ojuny bar <toggle|show|hide>"
        return "$OJUNY_EXIT_USAGE"
        ;;
    esac
}
