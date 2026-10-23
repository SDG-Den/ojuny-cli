patches_cache_dir() {
    ojuny_patches_cache_dir
}

patches_cache_repo_dir() {
    printf '%s/%s\n' "$(patches_cache_dir)" "$(ojuny_repo_name_from_url "$1")"
}

patches_cache_init() {
    mkdir -p "$(patches_cache_dir)"
}

patches_cache_lock() {
    printf '%s/.lock\n' "$(patches_cache_dir)"
}
