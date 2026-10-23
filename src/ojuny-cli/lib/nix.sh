nix_flake_update() {
    local flake="$1"
    local input="$2"
    (cd "$flake" && nix flake update "$input")
}

nix_flake_check() {
    local flake="$1"
    nix flake check "$flake"
}

nixos_dry_build() {
    local flake="$1"
    local host="$2"
    nixos-rebuild dry-build --flake "$flake#$host"
}

nixos_build() {
    local flake="$1"
    local host="$2"
    nixos-rebuild build --flake "$flake#$host"
}

nixos_activate_boot() {
    local flake="$1"
    local host="$2"
    nixos-rebuild boot --flake "$flake#$host" --sudo
}

nixos_activate_now() {
    local flake="$1"
    local host="$2"
    nixos-rebuild switch --flake "$flake#$host" --sudo
}
