OJUNY_ARGS=()

ojuny_parse_global_options() {
    OJUNY_ARGS=()

    while [ "$#" -gt 0 ]; do
        case "$1" in
        --flake)
            [ "$#" -ge 2 ] || ojuny_die "$OJUNY_EXIT_USAGE" "--flake requires a path"
            OJUNY_FLAKE="$2"
            shift 2
            ;;
        --host)
            [ "$#" -ge 2 ] || ojuny_die "$OJUNY_EXIT_USAGE" "--host requires a name"
            OJUNY_HOST="$2"
            shift 2
            ;;
        --yes | -y)
            OJUNY_YES=1
            shift
            ;;
        --dry-run)
            OJUNY_DRY_RUN=1
            shift
            ;;
        --)
            shift
            while [ "$#" -gt 0 ]; do
                OJUNY_ARGS+=("$1")
                shift
            done
            ;;
        *)
            OJUNY_ARGS+=("$1")
            shift
            ;;
        esac
    done
}

ojuny_need_args() {
    local required="$1"
    shift
    [ "$#" -ge "$required" ]
}

ojuny_no_extra_args() {
    local allowed="$1"
    shift
    [ "$#" -le "$allowed" ]
}
