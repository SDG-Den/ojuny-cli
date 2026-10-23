clipboard_subtree() {
    case "${1:-}" in
    open)
        dms_clipboard_open
        ;;
    clear)
        dms_clipboard_clear
        ;;
    *)
        ojuny_err "usage: ojuny clipboard <open|clear>"
        return "$OJUNY_EXIT_USAGE"
        ;;
    esac
}
