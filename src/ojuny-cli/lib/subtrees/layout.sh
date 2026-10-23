layout_subtree() {
    local command="${1:-}"
    shift || true

    case "$command" in
    set)
        if [ "$#" -lt 1 ]; then
            ojuny_err "usage: ojuny layout set <layout> [variant]"
            return "$OJUNY_EXIT_USAGE"
        fi
        msetlayout "$@"
        ;;
    current)
        mcurrentlayout
        ;;
    *)
        ojuny_err "usage: ojuny layout <set|current>"
        return "$OJUNY_EXIT_USAGE"
        ;;
    esac
}
