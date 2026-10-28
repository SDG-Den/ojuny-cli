capture_subtree() {
    case "${1:-}" in
    toolbar)
        dux_capture_toolbar
        ;;
    region)
        dux_screenshot
        ;;
    full)
        dux_screenshot full
        ;;
    window)
        dux_screenshot window
        ;;
    *)
        ojuny_err "usage: ojuny capture <toolbar|region|full|window>"
        return "$OJUNY_EXIT_USAGE"
        ;;
    esac
}
