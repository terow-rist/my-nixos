{ lib, pkgs, ... }:
let
  nix_ld_library_path = lib.makeLibraryPath (with pkgs; [
    stdenv.cc.cc
    libxcrypt-legacy
    zlib
    fuse
  ]);
  nix_ld = lib.fileContents "${pkgs.stdenv.cc}/nix-support/dynamic-linker";
in
{
  programs.nix-ld.enable = true;
  environment.systemPackages = with pkgs; [ stdenv.cc libxcrypt-legacy ];
  environment.variables = {
    NIX_LD_LIBRARY_PATH = lib.mkForce "${nix_ld_library_path}";
    NIX_LD = lib.mkForce "${nix_ld}";
  };
}
