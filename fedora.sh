#cat /etc/dnf/dnf.conf 
sudo echo "max_parallel_downloads=20" >> /etc/dnf/dnf.conf 
sudo echo "fastestmirror=True" >> /etc/dnf/dnf.conf 
sudo echo "defaultyes=True" >> /etc/dnf/dnf.conf 

# sudo fwupdmgr get-devices 
# sudo fwupdmgr refresh --force 
# sudo fwupdmgr get-updates 
# sudo fwupdmgr update

sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf install -y xorg-x11-server-Xwayland libxcb egl-wayland gnome-shell gnome-terminal nautilus xdg-user-dirs xdg-user-dirs-gtk 
sudo systemctl set-default graphical.target

sudo dnf group -y install "Hardware Support"

sudo dnf install -y gnome-software net-tools gnome-tweaks @development-tools gnome-extensions-app
sudo dnf install -y vlc steam btop gnome-system-monitor file-roller firefox gnome-terminal-nautilus gparted ffmpegthumbnailer gnome-browser-connector

sudo dnf install -y gstreamer1-plugins-{bad-*,good-*,ugly-*,base} gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel ffmpeg gstreamer-ffmpeg
sudo dnf -y groupupdate sound-and-video

sudo dnf config-manager --set-enabled fedora-cisco-openh264
sudo dnf install -y gstreamer1-plugin-openh264 mozilla-openh264
sudo dnf install -y fira-code-fonts 'mozilla-fira*' 'google-roboto*' 
sudo dnf install -y curl cabextract xorg-x11-font-utils fontconfig kitty

sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
sudo dnf install -y unzip p7zip p7zip-plugins unrar qbittorrent dnf-plugins-core fedora-workstation-repositories papirus-icon-theme gnome-weather

sudo dnf copr enable peterwu/rendezvous
sudo dnf install -y bibata-cursor-themes


# TEMAS 
# instalar gnome user themes em
# extensions.gnome.org/extension/19/user-themes
# na pasta ~/.themes instalar os arquivos -> descomprimir com tar xf arquivo
# https://www.pling.com/p/1357889?ref=itsfoss.com



# https://github.com/vinceliuice/Tela-icon-theme
# 



# https://extensions.gnome.org/extension/2890/tray-icons-reloaded
# https://extensions.gnome.org/extension/5090/space-bar



# instalar NVIDIA
# sudo dnf -y install kmod-nvidia







sudo dnf update -y # and reboot if you are not on the latest kernel
sudo dnf install akmod-nvidia # rhel/centos users can use kmod-nvidia instead
sudo dnf install xorg-x11-drv-nvidia-cuda #optional for cuda/nvdec/nvenc support



#sudo grubby --update-kernel=ALL --args='nvidia-drm.modeset=1'






























#NVIDIA wayland
#verificar se é wayland ou x11
#echo $XDG_SESSION_TYPE

# edit grub /etc/default/grub
## Example row with Fedora 38/37/36 BTRFS ##
#GRUB_CMDLINE_LINUX="rhgb quiet rd.driver.blacklist=nouveau nvidia-drm.modeset=1"
## OR with LVM ##
#GRUB_CMDLINE_LINUX="rd.lvm.lv=fedora/swap rd.lvm.lv=fedora/root rhgb quiet rd.driver.blacklist=nouveau nvidia-drm.modeset=1"


## BIOS and UEFI ##
#grub2-mkconfig -o /boot/grub2/grub.cfg


#Update /usr/lib/udev/rules.d/61-gdm.rules on Fedora 38/37/36
#Comment line 
#ENV{NVIDIA_PRESERVE_VIDEO_MEMORY_ALLOCATIONS}!=“1”, GOTO=“gdm_disable_wayland”


# generate initramfs
## Backup old initramfs nvidia-nomodeset image ##
#sudo mv /boot/initramfs-$(uname -r).img /boot/initramfs-$(uname -r)-nvidia-nomodeset.img
 
## Create new initramfs image ##
#dracut /boot/initramfs-$(uname -r).img $(uname -r)

# precisa sair r voltar  ao terminal
# e executar como usuário normal para verificar se 'kms-modifiers' está ativo -> responde apenas "@as []"
#gsettings get org.gnome.mutter experimental-features
# então executar
#gsettings set org.gnome.mutter experimental-features [\"kms-modifiers\"]



#reboot

# to change hostname
#nano /etc/hostname
# type the desired name and done

# check fully updated installation
#lsb_release -a 
# yes pra tudo





# para verificar
#nvidia-installer -v 
#echo $XDG_SESSION_TYPE #deve retornar 'wayland'

#watch -n1 nvidia-smi
# e verificar se processes tem programas que estão usando memoria gpu
# movimentar janelas deve aumentar gpu usage 





