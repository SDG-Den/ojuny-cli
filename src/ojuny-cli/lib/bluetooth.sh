bluetooth_open() {
    dms_controlcenter_toggle
}

bluetooth_status() {
    ojuny_require_command bluetoothctl
    bluetoothctl show
}

bluetooth_list() {
    ojuny_require_command bluetoothctl
    bluetoothctl devices
}

bluetooth_scan() {
    ojuny_require_command bluetoothctl
    bluetoothctl scan "$1"
}

bluetooth_power() {
    ojuny_require_command bluetoothctl
    bluetoothctl power "$1"
}

bluetooth_connect() {
    ojuny_require_command bluetoothctl
    bluetoothctl connect "$1"
}

bluetooth_disconnect() {
    ojuny_require_command bluetoothctl
    bluetoothctl disconnect "$1"
}
