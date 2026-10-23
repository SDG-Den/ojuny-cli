# ojuny-cli

Thin command line wrappers for the ojuny desktop, plus a git-backed patch
manager.

## Packages

- `ojuny` wraps mmsg, DMS, NetworkManager, BlueZ, PipeWire, playerctl,
  WireGuard, systemd, and Nix.
- `ojuny-patches` clones patch repositories and installs a patch by copying one
  Nix module into the local flake.

## Usage

```sh
ojuny --help
ojuny window float
ojuny flake validate
ojuny flake activate-boot

ojuny-patches repo list
ojuny-patches sync
ojuny-patches list available
ojuny-patches install patch-development-tools
```

Most `ojuny` commands change the running session only. Persistent settings
belong in the settings GUI. `ojuny flake` is the exception.

## Documentation

- `man ojuny`
- `man ojuny-patches`
- `docs/user.md`
- `docs/patches.md`
