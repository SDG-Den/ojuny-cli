window_subtree() {
    local command="${1:-}"
    shift || true

    case "$command" in
    list)
        mclientlist
        ;;
    kill)
        mkillclient
        ;;
    focus)
        if [ "$#" -lt 1 ]; then
            ojuny_err "usage: ojuny window focus <direction>"
            return "$OJUNY_EXIT_USAGE"
        fi
        mfocusdir "$1"
        ;;
    move)
        if [ "$#" -lt 1 ]; then
            ojuny_err "usage: ojuny window move <direction>"
            return "$OJUNY_EXIT_USAGE"
        fi
        mmoveclient "$1"
        ;;
    exchange)
        if [ "$#" -lt 1 ]; then
            ojuny_err "usage: ojuny window exchange <direction>"
            return "$OJUNY_EXIT_USAGE"
        fi
        mexchangeclient "$1"
        ;;
    resize)
        if [ "$#" -lt 1 ]; then
            ojuny_err "usage: ojuny window resize <direction>"
            return "$OJUNY_EXIT_USAGE"
        fi
        msmartresize "$1"
        ;;
    fullscreen)
        mfullscreen
        ;;
    maximize)
        mmaximize
        ;;
    float)
        mfloat
        ;;
    float-all)
        mfloatall
        ;;
    minimize)
        mminimize
        ;;
    restore)
        mrestore
        ;;
    pin)
        mdispatch togglepin
        ;;
    overlay)
        mdispatch toggleoverlay
        ;;
    detail)
        mclientlist
        ;;
    tag-special)
        mtagspecial
        ;;
    toggle-special)
        mtogglespecial
        ;;
    group-leave)
        mgroupleave
        ;;
    *)
        ojuny_err "usage: ojuny window <list|kill|focus|move|exchange|resize|fullscreen|maximize|float|float-all|minimize|restore|pin|overlay|detail|tag-special|toggle-special|group-leave>"
        return "$OJUNY_EXIT_USAGE"
        ;;
    esac
}
