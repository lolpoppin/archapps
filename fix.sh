sudo mv qt6ct.sh /etc/profile.d
echo "Fixing Nvidia"
sudo mkdir /etc/systemd/system/display-manager.service.d
sudo mv 99-systemd-dri-devices.rules /etc/udev/rules.d
sudo mv 10-wait-for-dri-devices.conf /etc/systemd/system/display-manager.service.d
echo "Nvidia Fixed"
echo "Reccommed Setting Up chotic aur and enabling multilib"
echo "Enable the Themes in qt6ct qt5ct ulauncher and xfce settings"
echo "Reboot Needed"
