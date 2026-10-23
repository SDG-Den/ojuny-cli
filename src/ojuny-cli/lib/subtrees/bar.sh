bar_preset() {
    local preset="${1:-}"
    local configs island

    if [ -z "$preset" ]; then
        ojuny_err "usage: ojuny bar preset <name>"
        return "$OJUNY_EXIT_USAGE"
    fi

    ojuny_require_command jq
    configs="$(dms_call settings get barConfigs)" || return $?

    island="$(printf '%s' "$configs" | jq -r --arg id "$preset" '.[] | select(.id == $id) | .island // false' | head -n 1)"
    if [ -z "$island" ]; then
        ojuny_err "unknown bar preset: $preset"
        return "$OJUNY_EXIT_USAGE"
    fi

    if [ "$island" = "true" ]; then
        ojuny_err "bar preset '$preset' is an island layout; save it in the settings GUI and rebuild"
        return "$OJUNY_EXIT_VALIDATION"
    fi

    if [ "$preset" = "caelestia" ] || [ "$preset" = "frame" ]; then
        dms_settings_set frameEnabled true >/dev/null || return $?
    else
        dms_settings_set frameEnabled false >/dev/null || return $?
    fi

    local id
    while IFS= read -r id; do
        if [ -n "$id" ]; then
            dms_bar_hide_id "$id" >/dev/null 2>&1 || true
        fi
    done < <(printf '%s' "$configs" | jq -r '.[] | select((.island // false) == false) | .id')

    dms_bar_reveal_id "$preset"
}

bar_subtree() {
    case "${1:-}" in
    preset)
        shift
        bar_preset "$@"
        ;;
    toggle)
        dms_bar_toggle
        ;;
    show)
        dms_call bar show
        ;;
    hide)
        dms_call bar hide
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
