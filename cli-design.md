functionality:

> wrapper over dms CLI

> wrapper over mmsg cli

> wrapper over networkmanager/bluetooth managemement

> simple system actions


command:

ojuny <category> <subcommand> <args>


categories:

# bar

make presets, toggle between: taskbar, frame/caelestia, island, dot, dock, default, custom

taskbar: windows-style taskbar setup
caelestia/frame: frame setup with sidebar
island: island-only setup
dot: dot-only setup (v2.0)
dock: top status bar + dock setup
default: ojuny defaults
custom: uses the user's settings

commands:
- preset <name>
- toggle/show/hide
- autohide toggle/show/hide
- move (left/right/top/bottom)


## dot subcommands

- open <activity>
- show <activity>/notifications
- cycle
- move <x> <y> (optional screen)
- center <x> <y> (optional screen)




# dock

- toggle
- autohide (enable/disable/toggle)



# layout

subcommand for switching to:
scroller
master
dwindle
deck
monocle

each with an optional <variant>:
vertical variant for deck/scroller

vertical/left/right/center for master



# sound

- list <inputs/outputs>
- input <inputname>
- output <outputname>
- volume <value/offset>
- current
- micvolume <value/offset>
- mute
- micmute



# network

- open NetworkManager or wrap networkmanager


# bluetooth

- open blueTUI? or wrap bluetoothctl


# window

- list
- kill <client>
- focus <client>
- detail <client>
- fullscreen <client>
- maximize <client>
- float <client>
- overlay <client>
- pin <client>
- resize <client> <w> <h>
- move <client> <x> <y>


# workspace

- view <num>
- toggle <num>
- move <client> <num>


# flake

- update <input>
- validate
- activate-boot
- activate-now
- build



# toggle

- nightmode
- idleinhibit
- sleep
- DoNotdisturb
- lockscreen
- screensaver


# display

- list
- resolution <display>
- toggle <display>
- sleep <display>


# media

- play/pause
- skip
- rewind
- stop
- status
- volume <val>


# dashboard

one sub-command for each tab to open it.


# island

- open <activity>
- show <activity>/notifications
- cycle
- move <x> <y> (optional screen)
- center <x> <y> (optional screen)

# spotlight

- open/close/toggle (optional mode)

same for spotlight-bar commands



# vpn

-wrap wg commands


# run
start application via mmsg dispatch spawn_shell

# dispatch
raw mmsg dispatch <X>,<Y>


# dux

raw dms ipc call <x> <y>

lifecycle: start / stop / restart / status

`ojuny dms` is a deprecated alias that warns and forwards to `ojuny dux`.
