#!/bin/bash

# Check if the script is executed with root privileges
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root (sudo)."
    exit 1
fi

# Set the username and command
USERNAME="seerish"
COMMAND="ALL"

# Add the sudoers configuration line
echo "$USERNAME ALL=(ALL:ALL) NOPASSWD: $COMMAND" | sudo EDITOR='tee -a' visudo

echo "Passwordless sudo configuration added for $USERNAME to run $COMMAND"

# Edit the Locale Configuration
# Uncomment the Desired Locale
sudo sed -i 's/^#\(en_US.UTF-8 UTF-8\)/\1/' /etc/locale.gen

# Save and Exit
# Note: Depending on the editor, you might need to manually save and exit

# Generate Locales
sudo locale-gen

# Set Default Locale
sudo pacman -Sy --noconfirm

# Install yaourt (an AUR helper)
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm

# Update yay package database
sudo yay -Syu --noconfirm

sudo touch /COPYRIGHT_YEARS

# Install dwz using yay
yay -S --noconfirm dwz

sudo pacman -S --noconfirm base-devel
git clone https://aur.archlinux.org/package-query.git
git clone https://aur.archlinux.org/yaourt.git
cd package-query
makepkg -si --noconfirm
cd ../yaourt
makepkg -si --noconfirm

sudo pacman -S --noconfirm xfce4
sudo pacman -S --noconfirm xfce4-goodies
sudo pacman -S --noconfirm lightdm lightdm-gtk-greeter



CXXFLAGS+=" -Wno-deprecated-copy"

yaourt -S --noconfirm yasem-git

sudo systemctl enable lightdm.service
sudo systemctl start lightdm.service

sudo reboot