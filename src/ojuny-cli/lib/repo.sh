repo_root() {
    git rev-parse --show-toplevel 2>/dev/null
}

repo_has_flake() {
    local root
    root="$(repo_root)" || return 1
    [ -f "$root/flake.nix" ]
}
