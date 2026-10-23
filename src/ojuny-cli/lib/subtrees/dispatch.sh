dispatch_subtree() {
    if [ "$#" -eq 0 ]; then
        ojuny_err "usage: ojuny dispatch <dispatcher> [arguments]"
        return "$OJUNY_EXIT_USAGE"
    fi
    mdispatch "$@"
}
