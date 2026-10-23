media_play() {
    ojuny_require_command playerctl
    playerctl play
}

media_pause() {
    ojuny_require_command playerctl
    playerctl pause
}

media_play_pause() {
    ojuny_require_command playerctl
    playerctl play-pause
}

media_next() {
    ojuny_require_command playerctl
    playerctl next
}

media_previous() {
    ojuny_require_command playerctl
    playerctl previous
}

media_stop() {
    ojuny_require_command playerctl
    playerctl stop
}

media_status() {
    ojuny_require_command playerctl
    playerctl status
}

media_volume() {
    ojuny_require_command playerctl
    playerctl volume "$1"
}
