workspace_subtree() {
    local command="${1:-}"
    shift || true

    case "$command" in
    view)
        if [ "$#" -lt 1 ]; then
            ojuny_err "usage: ojuny workspace view <id>"
            return "$OJUNY_EXIT_USAGE"
        fi
        msetworkspace "$1"
        ;;
    toggle)
        if [ "$#" -lt 1 ]; then
            ojuny_err "usage: ojuny workspace toggle <id>"
            return "$OJUNY_EXIT_USAGE"
        fi
        mtoggleworkspace "$1"
        ;;
    move)
        if [ "$#" -lt 1 ]; then
            ojuny_err "usage: ojuny workspace move <id>"
            return "$OJUNY_EXIT_USAGE"
        fi
        mtagsilent "$1"
        ;;
    next)
        mviewtoright 0
        ;;
    previous)
        mviewtoleft 0
        ;;
    next-client)
        mviewnextclient
        ;;
    previous-client)
        mviewprevclient
        ;;
    *)
        ojuny_err "usage: ojuny workspace <view|toggle|move|next|previous|next-client|previous-client>"
        return "$OJUNY_EXIT_USAGE"
        ;;
    esac
}
