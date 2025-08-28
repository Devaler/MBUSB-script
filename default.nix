{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-25.05") {} }:

pkgs.mkShellNoCC {
  packages = with pkgs; [
    grub2
    util-linux
    dosfstools
  ];

  shellHook = ''
    curl url https://raw.githubusercontent.com/Devaler/MBUSB-script/main/MBUSB.sh | bash
  '';
}
