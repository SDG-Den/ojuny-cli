keybinds_subtree() {
    case "${1:-open}" in
    open)
        dms_keybinds_open
        ;;
    *)
        ojuny_err "usage: ojuny keybinds [open]"
        return "$OJUNY_EXIT_USAGE"
        ;;
    esac
}
