# !! This script deletes the content of the selected drive !!

# Requirements : 
A USB, bash, grub2_efi and an internet connection.

# How to use :
`sudo nix-shell https://github.com/devaler/mbusb-script/`  
Put the regular ISOs in ${usb}/boot-isos/ . Such ISOs can be Arch, NixOS, etc. containing ${iso}/boot/grub/loopback.cfg . You can check that by mouting the ISOs. This is scripted with a prompt.  
Put other ISOs in ${usb}/other-isos/ , and will require a manual entry. Such ISOs can be memtest for example.  

# References:
- https://mbusb.aguslr.com/
- http://www.panticz.de/MultiBootUSB
- https://wiki.archlinux.org/title/Multiboot_USB_drive
- https://www.supergrubdisk.org/wiki/Loopback.cfg
- https://unix.stackexchange.com/questions/415049/generating-menuentry-for-iso-images-dynamically-in-grub-cfg
- https://www.linux.org/threads/understanding-the-various-grub-modules.11142/
- https://nix.dev/tutorials/first-steps/reproducible-scripts

# TBD:
Probably change grub.cfg
default.nix: pre-read the file (maybe read from github) in a variable, and then call that variable
maybe import
