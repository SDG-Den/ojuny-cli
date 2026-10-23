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
  util-linux,
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
    pname = "ojuny-patches-cli";
    program = "ojuny-patches";
    description = "Manage patches for ojuny";
    src = ../../src/ojuny-patches-cli;
    sharedLib = ../../src/lib;
    runtimeInputs = [
      coreutils
      gawk
      gnugrep
      gnused
      jq
      git
      nix
      util-linux
    ];
  }
