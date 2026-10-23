island_subtree() {
    local command="${1:-}"
    shift || true

    case "$command" in
    open)
        if [ "$#" -lt 1 ]; then
            ojuny_err "usage: ojuny island open <activity>"
            return "$OJUNY_EXIT_USAGE"
        fi
        dms_island_open "$1"
        ;;
    show)
        if [ "$#" -lt 1 ]; then
            ojuny_err "usage: ojuny island show <activity>"
            return "$OJUNY_EXIT_USAGE"
        fi
        dms_island_show "$1"
        ;;
    cycle)
        dms_island_cycle
        ;;
    move)
        if [ "$#" -lt 2 ]; then
            ojuny_err "usage: ojuny island move <x> <y>"
            return "$OJUNY_EXIT_USAGE"
        fi
        dms_island_move "$@"
        ;;
    center)
        if [ "$#" -lt 2 ]; then
            ojuny_err "usage: ojuny island center <x> <y>"
            return "$OJUNY_EXIT_USAGE"
        fi
        dms_island_center "$@"
        ;;
    *)
        ojuny_err "usage: ojuny island <open|show|cycle|move|center>"
        return "$OJUNY_EXIT_USAGE"
        ;;
    esac
}
