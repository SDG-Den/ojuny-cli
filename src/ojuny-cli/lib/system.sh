system_lock() {
    ojuny_require_command loginctl
    loginctl lock-session
}

system_logout() {
    ojuny_require_command loginctl
    [ -n "${XDG_SESSION_ID:-}" ] || ojuny_die "$OJUNY_EXIT_VALIDATION" "XDG_SESSION_ID is not set"
    loginctl terminate-session "$XDG_SESSION_ID"
}

system_suspend() {
    ojuny_require_command systemctl
    systemctl suspend
}

system_hibernate() {
    ojuny_require_command systemctl
    systemctl hibernate
}

system_reboot() {
    ojuny_require_command systemctl
    systemctl reboot
}

system_shutdown() {
    ojuny_require_command systemctl
    systemctl poweroff
}
