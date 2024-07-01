#!/bin/bash

# Step 1: Update the system
sudo pacman -Syu --noconfirm

# Step 2: Install Paru
sudo pacman -S --needed --noconfirm base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si --noconfirm
cd ..

# Step 3: Install KDE-Plasma and other Apps
paru -S --noconfirm bluedevil breeze breeze-gtk breeze-plymouth drkonqi flatpak-kcm kactivitymanagerd kde-cli-tools kde-gtk-config kdecoration kdeplasma-addons kgamma kglobalaccel kinfocenter kmenuedit kpipewire kscreen kscreenlocker ksystemstats kwayland kwin kwrited layer-shell-qt libkscreen libksysguard libplasma milou oxygen oxygen-sounds ocean-sound-theme plasma-browser-integration plasma-desktop plasma-disks plasma-firewall plasma-integration plasma-nm plasma-pa plasma-sdk plasma-systemmonitor plasma-workspace plasma-workspace-wallpapers plymouth-kcm polkit-kde-agent powerdevil print-manager qqc2-breeze-style sddm sddm-kcm systemsettings xdg-desktop-portal xdg-desktop-portal-kde ark audiocd-kio colord-kde dolphin dolphin-plugins kate kcalc kcharselect kcolorchooser kcron kdegraphics-thumbnailers kdesdk-thumbnailers kdialog kfind kget kio-admin konsole kontrast okular partitionmanager spectacle firefox flatpak vlc

# Step 4: Install printer support packages
paru -S --noconfirm cups cups-pdf system-config-printer

# Step 5: Enable and start CUPS
sudo systemctl enable cups
sudo systemctl start cups

# Step 6: Enable and start SDDM
sudo systemctl enable sddm
sudo systemctl start sddm

# Step 7: Set up Flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Step 8: Install Flatseal for managing Flatpak permissions
flatpak install flathub com.github.tchx84.Flatseal -y

echo "KDE-Plasma, applications, printer support, and enhanced Flatpak support installation completed."
