patches_usage() {
    cat <<'EOF'
Usage: ojuny-patches [options] <command>

Options:
  --flake <path>   Use this flake as the local repository
  --yes            Do not prompt
  -h, --help       Show help
  -V, --version    Show version

Commands:
  sync [repo]                  Clone or update repositories
  list available|installed     List patches
  configure <key> <value>      Set local_repository or patch_directory
  repo list|add|remove         Manage repositories
  install <id>                 Install a patch and its dependencies
  remove <id>                  Remove an installed patch
  info <id>                    Show patch information
  reinstall <id>               Remove and install a patch
EOF
}
