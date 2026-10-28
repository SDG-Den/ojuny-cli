network_open() {
    dux_network_open
}

network_status() {
    ojuny_require_command nmcli
    nmcli general status
}

network_list() {
    ojuny_require_command nmcli
    nmcli device status
}

network_connect() {
    ojuny_require_command nmcli
    nmcli device wifi connect "$1"
}

network_disconnect() {
    ojuny_require_command nmcli
    nmcli device disconnect "$1"
}

network_enable() {
    ojuny_require_command nmcli
    nmcli networking on
}

network_disable() {
    ojuny_require_command nmcli
    nmcli networking off
}
