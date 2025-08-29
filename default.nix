{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-25.05") {} }:

pkgs.mkShellNoCC {
  packages = with pkgs; [
    grub2_efi
    util-linux
    dosfstools
    curl
    rsync
  ];
}
