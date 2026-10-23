settings_subtree() {
    local command="${1:-}"
    shift || true

    case "$command" in
    open)
        if [ "$#" -lt 1 ]; then
            ojuny_err "usage: ojuny settings open <page>"
            return "$OJUNY_EXIT_USAGE"
        fi
        settings_open "$1"
        ;;
    *)
        ojuny_err "usage: ojuny settings open <page>"
        return "$OJUNY_EXIT_USAGE"
        ;;
    esac
}
