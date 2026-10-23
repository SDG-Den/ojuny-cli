sound_list() {
    ojuny_require_command wpctl
    wpctl status
}

sound_current() {
    ojuny_require_command wpctl
    printf 'output: '
    wpctl get-volume @DEFAULT_AUDIO_SINK@
    printf 'input:  '
    wpctl get-volume @DEFAULT_AUDIO_SOURCE@
}

sound_output() {
    ojuny_require_command wpctl
    wpctl set-default "$1"
}

sound_input() {
    ojuny_require_command wpctl
    wpctl set-default "$1"
}

sound_volume() {
    ojuny_require_command wpctl
    wpctl set-volume @DEFAULT_AUDIO_SINK@ "$1"
}

sound_micvolume() {
    ojuny_require_command wpctl
    wpctl set-volume @DEFAULT_AUDIO_SOURCE@ "$1"
}

sound_mute() {
    ojuny_require_command wpctl
    wpctl set-mute @DEFAULT_AUDIO_SINK@ "${1:-toggle}"
}

sound_micmute() {
    ojuny_require_command wpctl
    wpctl set-mute @DEFAULT_AUDIO_SOURCE@ "${1:-toggle}"
}
