dock_subtree() {
    case "${1:-}" in
    toggle)
        dms_dock_toggle
        ;;
    autohide)
        dms_call dock toggleAutoHide
        ;;
    *)
        ojuny_err "usage: ojuny dock <toggle|autohide>"
        return "$OJUNY_EXIT_USAGE"
        ;;
    esac
}
