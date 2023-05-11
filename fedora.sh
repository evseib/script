#cat /etc/dnf/dnf.conf
#[main]
#gpgcheck=1
#installonly_limit=3
#clean_requirements_on_remove=True
#best=False
#skip_if_unavailable=True
#max_parallel_downloads=10
#fastestmirror=True

sudo fwupdmgr get-devices 
sudo fwupdmgr refresh --force 
sudo fwupdmgr get-updates 
sudo fwupdmgr update

sudo dnf install -y @base-x gnome-shell gnome-terminal nautilus firefox
sudo systemctl set-default graphical.target
sudo dnf install -y chrome-gnome-shell gnome-tweaks @development-tools gnome-extensions-app

sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf install vlc steam btop gnome-shell-extensions gnome-shell-extensions-user-theme gnome-system-monitor file-roller 

sudo dnf group install "Hardware Support"
sudo dnf install gnome-terminal-nautilus gparted xdg-user-dirs xdg-user-dirs-gtk ffmpegthumbnailer

sudo dnf install gstreamer1-plugins-{bad-*,good-*,ugly-*,base} gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel ffmpeg gstreamer-ffmpeg
sudo dnf  groupupdate sound-and-video
sudo dnf config-manager --set-enabled fedora-cisco-openh264
sudo dnf install  gstreamer1-plugin-openh264 mozilla-openh264
sudo dnf install fira-code-fonts 'mozilla-fira*' 'google-roboto*'


sudo dnf install curl cabextract xorg-x11-font-utils fontconfig
sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
sudo dnf install  unzip p7zip p7zip-plugins unrar 
sudo dnf install qbittorrent 
sudo dnf install dnf-plugins-core
sudo dnf install fedora-workstation-repositories

sudo dnf copr enable peterwu/rendezvous
sudo dnf install -y bibata-cursor-themes








#NVIDIA wayland
dnf install xorg-x11-server-Xwayland libxcb egl-wayland

# edit grub /etc/default/grub
## Example row with Fedora 38/37/36 BTRFS ##
GRUB_CMDLINE_LINUX="rhgb quiet rd.driver.blacklist=nouveau nvidia-drm.modeset=1"
## OR with LVM ##
GRUB_CMDLINE_LINUX="rd.lvm.lv=fedora/swap rd.lvm.lv=fedora/root rhgb quiet rd.driver.blacklist=nouveau nvidia-drm.modeset=1"


## BIOS and UEFI ##
grub2-mkconfig -o /boot/grub2/grub.cfg


#Update /usr/lib/udev/rules.d/61-gdm.rules on Fedora 38/37/36
#Comment line 
ENV{NVIDIA_PRESERVE_VIDEO_MEMORY_ALLOCATIONS}!=“1”, GOTO=“gdm_disable_wayland”


# generate initramfs
## Backup old initramfs nvidia-nomodeset image ##
mv /boot/initramfs-$(uname -r).img /boot/initramfs-$(uname -r)-nvidia-nomodeset.img
 
## Create new initramfs image ##
dracut /boot/initramfs-$(uname -r).img $(uname -r)


gsettings set org.gnome.mutter experimental-features [\"kms-modifiers\"]



reboot














