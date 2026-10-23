ojuny_join_by() {
    local separator="$1"
    shift
    local first=1 value
    for value in "$@"; do
        if [ "$first" -eq 1 ]; then
            printf '%s' "$value"
            first=0
        else
            printf '%s%s' "$separator" "$value"
        fi
    done
}

ojuny_trim() {
    local value="$1"
    value="${value#"${value%%[![:space:]]*}"}"
    value="${value%"${value##*[![:space:]]}"}"
    printf '%s\n' "$value"
}
