sudo pacman -S base-devel fakeroot debugedit nvidia-open nvidia-settings flatpak lightdm-gtk-greeter-settings kitty file-roller
sudo pacman -Rns xfce4-terminal
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
paru helium-browser-bin
paru ulauncher
paru qt6ct-kde
paru qt5ct-kde
cd
cd archsetup
echo "Theme"
git clone https://github.com/vinceliuice/Graphite-gtk-theme
Graphite-gtk-theme/install.sh --tweaks nord
git clone https://github.com/vinceliuice/Graphite-kde-theme
Graphite-kde-theme/install.sh -t nord
mkdir ~/.config/ulauncher/user-themes
git clone https://github.com/KiranWells/ulauncher-nord/ \
  ~/.config/ulauncher/user-themes/nord
sudo mv qt6ct.sh /etc/profile.d
echo "Fixing Nvidia"
sudo mkdir /etc/systemd/system/display-manager.service.d
sudo mv 99-systemd-dri-devices.rules /etc/udev/rules.d
sudo mv 10-wait-for-dri-devices.conf /etc/systemd/system/display-manager.service.d
echo "Nvidia Fixed"
echo "Cleaning Files Deleting archsetup"
cd
rm -rf archsetup
echo "Finished Cleaning Files"
echo "Reccommed Setting Up chotic aur and enabling multilib"
echo "Enable the Themes in qt6ct qt5ct ulauncher and xfce settings"
echo "Reboot Needed"
