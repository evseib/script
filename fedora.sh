#cat /etc/dnf/dnf.conf 
sudo echo "max_parallel_downloads=20" >> /etc/dnf/dnf.conf 
sudo echo "fastestmirror=True" >> /etc/dnf/dnf.conf 
sudo echo "defaultyes=True" >> /etc/dnf/dnf.conf 
sudo echo "alias 'll=ls -la --color=auto'" >> ~/.bashrc


# sudo fwupdmgr get-devices 
# sudo fwupdmgr refresh --force 
# sudo fwupdmgr get-updates 
# sudo fwupdmgr update

sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf install -y xorg-x11-server-Xwayland libxcb egl-wayland gnome-shell gnome-terminal nautilus xdg-user-dirs xdg-user-dirs-gtk 
# sudo systemctl set-default graphical.target  # faz isso depois de instalar os drivers nvidia

sudo dnf group -y install "Hardware Support"
sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
sudo dnf config-manager --set-enabled fedora-cisco-openh264

sudo dnf install -y gnome-software net-tools gnome-tweaks @development-tools gnome-extensions-app vlc steam btop gnome-system-monitor file-roller firefox gnome-terminal-nautilus gparted ffmpegthumbnailer gnome-browser-connector
sudo dnf install -y gstreamer1-plugins-{bad-*,good-*,ugly-*,base} gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel ffmpeg gstreamer-ffmpeg
sudo dnf -y groupupdate sound-and-video

sudo dnf install -y gstreamer1-plugin-openh264 mozilla-openh264 fira-code-fonts 'mozilla-fira*' 'google-roboto*' curl cabextract xorg-x11-font-utils fontconfig kitty unzip p7zip p7zip-plugins unrar qbittorrent dnf-plugins-core fedora-workstation-repositories papirus-icon-theme hydrapaper 

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
# https://extensions.gnome.org/extension/5446/quick-settings-tweaker/
# https://extensions.gnome.org/extension/307/dash-to-dock/


# instalar NVIDIA
# sudo dnf update -y # and reboot if you are not on the latest kernel
# reiniciar antes daqui
# sudo dnf install akmod-nvidia xorg-x11-drv-nvidia-cuda 

# sudo systemctl set-default graphical.target




# to change hostname
#nano /etc/hostname
# type the desired name and done


# para verificar instalação nvidia
#nvidia-installer -v 
#echo $XDG_SESSION_TYPE #deve retornar 'wayland'

#watch -n1 nvidia-smi
# e verificar se processes tem programas que estão usando memoria gpu
# movimentar janelas deve aumentar gpu usage 

