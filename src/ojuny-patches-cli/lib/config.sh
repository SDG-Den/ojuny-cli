patches_config_file() {
    ojuny_patches_config_file
}

patches_config_get() {
    ojuny_config_get "$(patches_config_file)" "$1"
}

patches_config_set() {
    ojuny_config_set "$(patches_config_file)" "$1" "$2"
}

patches_repos_file() {
    ojuny_patches_repos_file
}

patches_ensure_config() {
    mkdir -p "$(ojuny_patches_config_dir)"
}

patches_ensure_repos_file() {
    local file
    patches_ensure_config
    file="$(patches_repos_file)"
    if [ ! -f "$file" ]; then
        printf '%s\n' "$OJUNY_DEFAULT_PATCH_REPO" >"$file"
    fi
}
