bar_preset() {
    local preset="${1:-}"
    local configs island enabled

    if [ -z "$preset" ]; then
        ojuny_err "usage: ojuny bar preset <name>"
        return "$OJUNY_EXIT_USAGE"
    fi

    ojuny_require_command jq
    configs="$(dux_call settings get barConfigs)" || return $?

    IFS=$'\t' read -r island enabled < <(
        printf '%s' "$configs" |
            jq -r --arg id "$preset" '.[] | select(.id == $id) | "\(.island // false)\t\(if .enabled == null then true else .enabled end)"' |
            head -n 1
    ) || true
    if [ -z "$island" ]; then
        ojuny_err "unknown bar preset: $preset"
        return "$OJUNY_EXIT_USAGE"
    fi

    if [ "$enabled" = "false" ]; then
        ojuny_err "bar preset '$preset' is not enabled; save and rebuild to activate it"
        return "$OJUNY_EXIT_VALIDATION"
    fi

    if [ "$island" = "true" ]; then
        ojuny_err "bar preset '$preset' is an island layout; save it in the settings GUI and rebuild"
        return "$OJUNY_EXIT_VALIDATION"
    fi

    if [ "$preset" = "caelestia" ] || [ "$preset" = "frame" ]; then
        dux_settings_set frameEnabled true >/dev/null || return $?
    else
        dux_settings_set frameEnabled false >/dev/null || return $?
    fi

    local id
    while IFS= read -r id; do
        if [ -n "$id" ]; then
            dux_bar_hide_id "$id" >/dev/null 2>&1 || true
        fi
    done < <(printf '%s' "$configs" | jq -r '.[] | select((.island // false) == false) | .id')

    dux_bar_reveal_id "$preset"
}

bar_subtree() {
    case "${1:-}" in
    preset)
        shift
        bar_preset "$@"
        ;;
    toggle)
        dux_bar_toggle
        ;;
    show)
        dux_call bar show
        ;;
    hide)
        dux_call bar hide
        ;;
    autohide | move)
        ojuny_err "persistent setting; use 'ojuny settings open bar'"
        return "$OJUNY_EXIT_VALIDATION"
        ;;
    *)
        ojuny_err "usage: ojuny bar <preset|toggle|show|hide>"
        return "$OJUNY_EXIT_USAGE"
        ;;
    esac
}
