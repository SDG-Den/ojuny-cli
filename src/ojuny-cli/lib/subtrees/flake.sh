flake_subtree() {
    local command="${1:-}"
    shift || true
    local flake host status failed

    flake="$(ojuny_flake_root)" || return

    case "$command" in
    update)
        if [ "$#" -lt 1 ]; then
            ojuny_err "usage: ojuny flake update <input>"
            return "$OJUNY_EXIT_USAGE"
        fi
        ojuny_flake_context pending
        status=0
        nix_flake_update "$flake" "$1" || status=$?
        ojuny_flake_result "$status"
        return "$status"
        ;;
    validate)
        host="$(ojuny_host_name)" || return
        status=0
        failed=""
        nix_flake_check "$flake" || {
            status=$?
            failed="nix flake check"
        }
        if [ "$status" -eq 0 ]; then
            nixos_dry_build "$flake" "$host" || {
                status=$?
                failed="nixos-rebuild dry-build"
            }
        fi
        ojuny_flake_context "$([ "$status" -eq 0 ] && printf ok || printf failed)"
        if ! ojuny_print_patch_state; then
            [ "$status" -ne 0 ] || status=1
        fi
        if [ -n "$failed" ]; then
            printf '  failed: %s\n' "$failed"
        fi
        return "$status"
        ;;
    build)
        host="$(ojuny_host_name)" || return
        ojuny_flake_context pending
        status=0
        nixos_build "$flake" "$host" || status=$?
        ojuny_flake_result "$status"
        return "$status"
        ;;
    activate-boot)
        host="$(ojuny_host_name)" || return
        ojuny_flake_context pending
        status=0
        nixos_activate_boot "$flake" "$host" || status=$?
        ojuny_flake_result "$status"
        return "$status"
        ;;
    activate-now)
        host="$(ojuny_host_name)" || return
        ojuny_flake_context pending
        status=0
        nixos_activate_now "$flake" "$host" || status=$?
        ojuny_flake_result "$status"
        return "$status"
        ;;
    *)
        ojuny_err "usage: ojuny flake <update|validate|build|activate-boot|activate-now>"
        return "$OJUNY_EXIT_USAGE"
        ;;
    esac
}
