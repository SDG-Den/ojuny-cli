sound_subtree() {
    local command="${1:-}"
    shift || true

    case "$command" in
    list)
        sound_list
        ;;
    input)
        if [ "$#" -lt 1 ]; then
            ojuny_err "usage: ojuny sound input <id>"
            return "$OJUNY_EXIT_USAGE"
        fi
        sound_input "$1"
        ;;
    output)
        if [ "$#" -lt 1 ]; then
            ojuny_err "usage: ojuny sound output <id>"
            return "$OJUNY_EXIT_USAGE"
        fi
        sound_output "$1"
        ;;
    volume)
        if [ "$#" -lt 1 ]; then
            ojuny_err "usage: ojuny sound volume <value>"
            return "$OJUNY_EXIT_USAGE"
        fi
        sound_volume "$1"
        ;;
    micvolume)
        if [ "$#" -lt 1 ]; then
            ojuny_err "usage: ojuny sound micvolume <value>"
            return "$OJUNY_EXIT_USAGE"
        fi
        sound_micvolume "$1"
        ;;
    current)
        sound_current
        ;;
    mute)
        sound_mute "${1:-toggle}"
        ;;
    micmute)
        sound_micmute "${1:-toggle}"
        ;;
    *)
        ojuny_err "usage: ojuny sound <list|input|output|volume|micvolume|current|mute|micmute>"
        return "$OJUNY_EXIT_USAGE"
        ;;
    esac
}
