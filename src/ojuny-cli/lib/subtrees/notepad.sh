notepad_subtree() {
    case "${1:-}" in
    open | toggle)
        dms_notepad_toggle
        ;;
    *)
        ojuny_err "usage: ojuny notepad <open|toggle>"
        return "$OJUNY_EXIT_USAGE"
        ;;
    esac
}
