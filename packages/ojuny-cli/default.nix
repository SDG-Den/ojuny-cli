{
  lib,
  stdenvNoCC,
  scdoc,
  bash,
  coreutils,
  gawk,
  gnugrep,
  gnused,
  jq,
  git,
  nix,
  nixos-rebuild,
  util-linux,
  systemd,
  networkmanager,
  bluez,
  wireplumber,
  playerctl,
  wireguard-tools,
}:

(import ../../lib/mk-cli.nix {
  inherit
    lib
    stdenvNoCC
    scdoc
    bash
    ;
})
  {
    pname = "ojuny-cli";
    program = "ojuny";
    description = "Main entry point for the ojuny command line utilities";
    src = ../../src/ojuny-cli;
    sharedLib = ../../src/lib;
    runtimeInputs = [
      coreutils
      gawk
      gnugrep
      gnused
      jq
      git
      nix
      nixos-rebuild
      util-linux
      systemd
      networkmanager
      bluez
      wireplumber
      playerctl
      wireguard-tools
    ];
  }
