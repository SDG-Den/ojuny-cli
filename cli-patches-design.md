functionality:

> patch installation

> local patch listing

> remote patch lookup (patch-registry git repo)

> patch removal

> patch re-installation


ojuny-patches repository structure


folder (patch name)
 - metadata.md
 - patch.nix


metadata needs to contain:
 - name
 - id
 - description
 - dependencies on other patches
 - version

config keys:
 - local repository (default $HOME/repos/nix-flake)
 - patch directory (default modules/patches)

 repos.list:
 - newline-separated list of repositories


 commands:

 ojuny-patch <subcommand>

 subcommands:

 sync - syncs the local cache (clones/git pulls all patch repositories in the cache), optional arg for specific repo
 list - takes arg <available/installed>, lists either available or installed patches
 configure - configures a settings key for ojuny-patch, takes <key> <val>
 repo - repository subcommands
 install <id> - copies patch.nix to the local patch dir, renaming to the patch id
 remove <id> - removes a patch by id
 info <id> - shows information about the patch
 reinstall <id> - combination remove + install


 repo subcommands:

 list - lists repositories
 add - add a repository
 remove - remove a repository