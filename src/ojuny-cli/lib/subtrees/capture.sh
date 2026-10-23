capture_subtree() {
    case "${1:-}" in
    toolbar)
        dms_capture_toolbar
        ;;
    region)
        dms_screenshot
        ;;
    full)
        dms_screenshot full
        ;;
    window)
        dms_screenshot window
        ;;
    *)
        ojuny_err "usage: ojuny capture <toolbar|region|full|window>"
        return "$OJUNY_EXIT_USAGE"
        ;;
    esac
}
