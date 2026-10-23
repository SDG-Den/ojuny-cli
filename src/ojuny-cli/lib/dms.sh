dms_call() {
    local object="$1"
    local method="$2"
    shift 2
    ojuny_require_command dms
    dms ipc call "$object" "$method" "$@"
}

dms_ipc() {
    ojuny_require_command dms
    dms ipc "$@"
}

dms_start() {
    ojuny_require_command dms
    dms run
}

dms_stop() {
    ojuny_require_command dms
    dms kill
}

dms_restart() {
    ojuny_require_command dms
    dms kill
    if command -v mmsg >/dev/null 2>&1; then
        mdispatch spawn_shell "dms run"
    else
        dms run
    fi
}

dms_status() {
    ojuny_require_command dms
    dms --version
}

dms_screenshot() {
    ojuny_require_command dms
    dms screenshot "$@"
}

dms_settings_open() {
    local page="$1"
    dms_call settings focusOrToggleWith "$page"
}

dms_network_open() {
    dms_settings_open network
}

dms_keybinds_open() {
    dms_call keybinds open binds
}

dms_clipboard_open() {
    dms_call clipboard toggle
}

dms_clipboard_clear() {
    dms_call clipboard clear
}

dms_notepad_toggle() {
    dms_call notepad toggle
}

dms_spotlight_toggle() {
    dms_call spotlight toggle
}

dms_spotlight_query() {
    dms_call spotlight toggleQuery "$1"
}

dms_controlcenter_toggle() {
    dms_call control-center toggle
}

dms_menu_toggle() {
    dms_call dankMenu toggle root
}

dms_bar_toggle() {
    dms_call bar toggle
}

dms_dock_toggle() {
    dms_call dock toggle
}

dms_inhibit_toggle() {
    dms_call inhibit toggle
}

dms_inhibit_status() {
    dms_call inhibit status
}

dms_night_toggle() {
    dms_call night toggle
}

dms_night_status() {
    dms_call night status
}

dms_dnd_toggle() {
    dms_call notifications toggleDoNotDisturb
}

dms_dashboard_open() {
    dms_call dash open "$1"
}

dms_dashboard_close() {
    dms_call dash close
}

dms_dashboard_toggle() {
    dms_call dash toggle "$1"
}

dms_island_open() {
    dms_call island open "$1"
}

dms_island_show() {
    dms_call island open "$1"
}

dms_island_cycle() {
    dms_call island cycle
}

dms_island_move() {
    dms_call island move "$@"
}

dms_island_center() {
    dms_call island center "$@"
}

dms_capture_toolbar() {
    dms_call screenCaptureToolbar toggle
}
