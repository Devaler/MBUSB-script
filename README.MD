# !! This script deletes the content of the selected drive !!

# Requirements : 
A USB, bash, grub2_efi and an internet connection.

# How to use :
`sudo nix-shell https://github.com/Devaler/MBUSB-script/archive/refs/heads/main.zip --run 'find . -name "MBUSB.sh" -exec bash {} \;'`  
Put the regular ISOs in ${usb}/boot-isos/ . Such ISOs can be Arch, NixOS, etc. containing ${iso}/boot/grub/loopback.cfg . You can check that by mouting the ISOs. This is scripted with a prompt.  
Put other ISOs in ${usb}/other-isos/ , and will require a manual entry. Such ISOs can be memtest for example.  

# References:
- https://git.savannah.gnu.org/git/grub.git/
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

# Nota bene:
I started this project because i needed a simple automated solution for my problem: I wanted a multi-ISOs USB, but Ventoy is shady. At first, I don't think I found any such project, but by myself encountering issues and searching through forums and documentations, i found many. Some were unmaintained, some were too broad, etc. I could have used them, but I thought this: I had to finish this project for once, and I was not making something totally useless because I aimed for a short program, length and time-wise.  
Later on in the project, as I was really struggling with GRUB scripting and its documentation, I found an "autoiso.cfg" file in the supergrubdisk that answered my very issue (it answered too much). Exhausted, I decided to "give up" and copy the snippets of codes that really mattered for my project, but I didn't understood some, so I searched deeper.  
The final key to my problem was the thing I should have done (almost) first, checking GRUB's source code, which also had a (clearer) "autoiso.cfg" file. In the end, this is not a 1:1 copy at all, but I absolutely could not have found the fixes by myself.  
This isn't a total failure either, I have learned a lot about GRUB, bash scripting, Linux, and even a little about Nix. But it was a lot of "pointless" struggle, so I am pretty sore and tired now.
# Holy yap
