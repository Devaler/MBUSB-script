#!/bin/sh

# Security checks and infos
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi
read -p "Enter USB name (i.e: sda) : " usb
echo "WARNING: This will delete ALL data on /dev/$usb!"
read -p "Are you sure you want to continue? (y/N): " confirm
if [[ $confirm != "y" && $confirm != "Y" ]]; then
    echo "Operation cancelled."
    exit 1
fi

sfdisk --delete /dev/$usb
echo 'type=EFI' | sfdisk /dev/$usb
mkfs.vfat -F 32 -I /dev/$usb
mount /dev/${usb}1 /mnt
mkdir /mnt/{boot,boot-isos,other-isos}

grub-install --target=x86_64-efi --removable --boot-directory=/mnt/boot --efi-directory=/mnt
curl -o $url /mnt/boot/grub/grub.cfg

umount /mnt
