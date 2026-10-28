clipboard_subtree() {
    case "${1:-}" in
    open)
        dux_clipboard_open
        ;;
    clear)
        dux_clipboard_clear
        ;;
    *)
        ojuny_err "usage: ojuny clipboard <open|clear>"
        return "$OJUNY_EXIT_USAGE"
        ;;
    esac
}
