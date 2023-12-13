#!/bin/bash

# Edit the Locale Configuration
# Uncomment the Desired Locale
sudo sed -i 's/^#\(en_US.UTF-8 UTF-8\)/\1/' /etc/locale.gen

# Save and Exit
# Note: Depending on the editor, you might need to manually save and exit

# Generate Locales
sudo locale-gen

# Set Default Locale
echo "LANG=en_US.UTF-8" | sudo tee /etc/locale.conf

# Update package database
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

CXXFLAGS+=" -Wno-deprecated-copy"
yaourt -S --noconfirm yasem-git
