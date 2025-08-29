{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-25.05") {} }:

pkgs.mkShellNoCC {
  packages = with pkgs; [
    grub2_efi
    util-linux
    dosfstools
  ];

  shellHook = ''
# Infos and checks
[ "$(id -u)" -ne 0 ] && echo "Run as root" && exit 1
read -p "Enter USB name (i.e: sda): " usb
echo "WARNING: This will delete ALL data on /dev/\${usb}!"
read -p "Are you sure? (y/N): " confirm
[ "$confirm" != "y" ] && [ "$confirm" != "Y" ] && echo "Cancelled." && exit 1

# Format USB
wipefs -a /dev/\${usb}
echo -e 'label: gpt\n, , U' | sfdisk /dev/\${usb}
mkfs.vfat -F 32 /dev/\${usb}1

# Mount and setup
mkdir -p /mnt/usb
mount /dev/\${usb}1 /mnt/usb
mkdir -p /mnt/usb/{boot,boot-isos,other-isos}

# Install GRUB
grub-install --target=x86_64-efi --removable --boot-directory=/mnt/usb/boot --efi-directory=/mnt/usb
curl https://raw.githubusercontent.com/Devaler/MBUSB-script/main/grub.cfg -o /mnt/usb/boot/grub/grub.cfg

# Copy ISOs
read -p "Path to ISO files (enter for current dir): " isodir
isodir=\${isodir:-.}
[ -d "\$isodir" ] && rsync -ah --progress --no-compress --whole-file --inplace --size-only --no-owner --no-group "$isodir"/*.iso /mnt/usb/boot-isos/

# Cleanup
umount /mnt/usb && rm -rf /mnt/usb
  '';
}
