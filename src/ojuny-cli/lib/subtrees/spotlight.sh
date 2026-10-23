spotlight_subtree() {
    local command="${1:-}"
    shift || true

    case "$command" in
    toggle | open | close)
        dms_spotlight_toggle
        ;;
    query)
        if [ "$#" -lt 1 ]; then
            ojuny_err "usage: ojuny spotlight query <text>"
            return "$OJUNY_EXIT_USAGE"
        fi
        dms_spotlight_query "$1"
        ;;
    *)
        ojuny_err "usage: ojuny spotlight <toggle|open|close|query>"
        return "$OJUNY_EXIT_USAGE"
        ;;
    esac
}
