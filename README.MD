# !! This script deletes the content of the selected drive !!

# Requirements : 
A USB, bash, grub2_efi and an internet connection.

# How to use :
You only need create_a_multiboot_usb.sh. Run it with sudo.  
Put the regular ISOs in ${usb}/boot-isos/ . Such ISOs can be Arch, NixOS, etc. containing ${iso}/boot/grub/loopback.cfg . You can check that by mouting the ISOs.  
Put other ISOs in ${usb}/other-isos/ , and will require a manual entry. Such ISOs can be memtest for example.  

# References:
- https://mbusb.aguslr.com/
- http://www.panticz.de/MultiBootUSB
- https://www.supergrubdisk.org/wiki/Loopback.cfg
- https://unix.stackexchange.com/questions/415049/generating-menuentry-for-iso-images-dynamically-in-grub-cfg
- https://www.linux.org/threads/understanding-the-various-grub-modules.11142/

# TBD:
Probably change grub.cfg
