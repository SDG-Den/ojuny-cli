media_subtree() {
    local command="${1:-}"
    shift || true

    case "$command" in
    play)
        media_play
        ;;
    pause)
        media_pause
        ;;
    play-pause | toggle)
        media_play_pause
        ;;
    next | skip)
        media_next
        ;;
    previous | rewind)
        media_previous
        ;;
    stop)
        media_stop
        ;;
    status)
        media_status
        ;;
    volume)
        if [ "$#" -lt 1 ]; then
            ojuny_err "usage: ojuny media volume <value>"
            return "$OJUNY_EXIT_USAGE"
        fi
        media_volume "$1"
        ;;
    *)
        ojuny_err "usage: ojuny media <play|pause|play-pause|next|previous|stop|status|volume>"
        return "$OJUNY_EXIT_USAGE"
        ;;
    esac
}
