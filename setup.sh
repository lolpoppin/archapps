echo "Installing Packages 1/14"
sudo pacman -S base-devel fakeroot debugedit nvidia-open nvidia-settings flatpak lightdm-gtk-greeter-settings kitty file-roller nwg-look
echo "Removing Build in terminal 2/14"
sudo pacman -Rns xfce4-terminal
echo "Building paru 3/14"
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
echo "Downloading paru apps 4/14"
paru helium-browser-bin
paru ulauncher
paru qt6ct-kde
paru qt5ct-kde
echo "Going back to the arch setup dir 5/14"
cd
cd archsetup
echo "Theme 6/14"
git clone https://github.com/vinceliuice/Graphite-gtk-theme
Graphite-gtk-theme/install.sh --tweaks nord
git clone https://github.com/vinceliuice/Graphite-kde-theme
Graphite-kde-theme/install.sh -t nord
mkdir ~/.config/ulauncher/user-themes
git clone https://github.com/KiranWells/ulauncher-nord/ \
  ~/.config/ulauncher/user-themes/nord
sudo mv qt6ct.sh /etc/profile.d
echo "Icon Theme 7/14"
wget -qO- https://git.io/papirus-icon-theme-install | sh
echo "Fixing Nvidia 8/14"
sudo mkdir /etc/systemd/system/display-manager.service.d
sudo mv 99-systemd-dri-devices.rules /etc/udev/rules.d
sudo mv 10-wait-for-dri-devices.conf /etc/systemd/system/display-manager.service.d
echo "Nvidia Fixed 9/14"
echo "Applying Config 10/14"
cd 
rm -rf .config/xfce4
mv archsetup/xfce4 .config
echo "config applied 11/14"
echo "Cleaning Files Deleting archsetup 12/14"
cd
rm -rf archsetup
echo "Finished Cleaning Files 13/14"
echo "Reccommed Setting Up chotic aur and enabling multilib"
echo "Enable the Themes in qt6ct qt5ct ulauncher and xfce settings"
echo "Reboot Needed 14/14"
