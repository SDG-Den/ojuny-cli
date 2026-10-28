dashboard_subtree() {
    local command="${1:-}"
    shift || true

    case "$command" in
    open)
        if [ "$#" -lt 1 ]; then
            ojuny_err "usage: ojuny dashboard open <tab>"
            return "$OJUNY_EXIT_USAGE"
        fi
        dux_dashboard_open "$1"
        ;;
    close)
        dux_dashboard_close
        ;;
    toggle)
        if [ "$#" -lt 1 ]; then
            ojuny_err "usage: ojuny dashboard toggle <tab>"
            return "$OJUNY_EXIT_USAGE"
        fi
        dux_dashboard_toggle "$1"
        ;;
    *)
        ojuny_err "usage: ojuny dashboard <open|close|toggle>"
        return "$OJUNY_EXIT_USAGE"
        ;;
    esac
}
