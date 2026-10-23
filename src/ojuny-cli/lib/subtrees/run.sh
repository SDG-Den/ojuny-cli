run_subtree() {
    if [ "$#" -eq 0 ]; then
        ojuny_err "usage: ojuny run <application> [arguments]"
        return "$OJUNY_EXIT_USAGE"
    fi

    if [ "$1" = "--shell" ]; then
        shift
        if [ "$#" -eq 0 ]; then
            ojuny_err "usage: ojuny run --shell <command>"
            return "$OJUNY_EXIT_USAGE"
        fi
        mspawnshell "$*"
    else
        mspawn "$*"
    fi
}
