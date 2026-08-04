echo "This is just a collection of stuff i like to have on my setup This script is all I made I don't take credit for it"
echo "Installing Packages And adding chaotic-AUR 1/14"
bash <(curl -s https://raw.githubusercontent.com/yakuda-stack/Chaotic-AUR-Setup/main/setup.sh)
sudo pacman -S base-devel fakeroot debugedit nvidia-open nvidia-settings flatpak lightdm-gtk-greeter-settings kitty file-roller nwg-look ulauncher helium-browser-bin qt6ct-kde
echo "Removing Build in terminal 2/14"
sudo pacman -Rns xfce4-terminal
echo "Building paru 3/14"
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
echo "Downloading paru apps 4/14"
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
echo "Enable the Themes in qt6ct qt5ct ulauncher and xfce settings"
echo "Reboot Needed 14/14"
