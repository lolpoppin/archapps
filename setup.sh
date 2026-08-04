echo "Installing Packages 1/12"
sudo pacman -S base-devel fakeroot debugedit nvidia-open nvidia-settings flatpak lightdm-gtk-greeter-settings kitty file-roller
echo "Removing Build in terminal 2/12"
sudo pacman -Rns xfce4-terminal
echo "Building paru 3/12"
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
echo "Downloading paru apps 4/12"
paru helium-browser-bin
paru ulauncher
paru qt6ct-kde
paru qt5ct-kde
echo "Going back to the arch setup dir 5/12"
cd
cd archsetup
echo "Theme 6/12"
git clone https://github.com/vinceliuice/Graphite-gtk-theme
Graphite-gtk-theme/install.sh --tweaks nord
git clone https://github.com/vinceliuice/Graphite-kde-theme
Graphite-kde-theme/install.sh -t nord
mkdir ~/.config/ulauncher/user-themes
git clone https://github.com/KiranWells/ulauncher-nord/ \
  ~/.config/ulauncher/user-themes/nord
sudo mv qt6ct.sh /etc/profile.d
echo "Icon Theme 7/12
wget -qO- https://git.io/papirus-icon-theme-install | sh
echo "Fixing Nvidia 8/12"
sudo mkdir /etc/systemd/system/display-manager.service.d
sudo mv 99-systemd-dri-devices.rules /etc/udev/rules.d
sudo mv 10-wait-for-dri-devices.conf /etc/systemd/system/display-manager.service.d
echo "Nvidia Fixed 9/12"
echo "Cleaning Files Deleting archsetup 10/12"
cd
rm -rf archsetup
echo "Finished Cleaning Files 11/12"
echo "Reccommed Setting Up chotic aur and enabling multilib"
echo "Enable the Themes in qt6ct qt5ct ulauncher and xfce settings"
echo "Reboot Needed 12/12"
