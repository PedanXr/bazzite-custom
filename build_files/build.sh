#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 install -y tmux 

enable_copr solopasha/hyprland
enable_copr erikreider/SwayNotificationCenter
enable_copr pgdev/ghostty
enable_copr wezfurlong/wezterm-nightly

# Use COPR Example:
dnf5 -y copr enable ublue-os/staging

dnf5 install -y --setopt=install_weak_deps=False \
    xdg-desktop-portal-hyprland \
    hyprland \
    hyprlock \
    hypridle \
    hyprpicker \
    hyprsysteminfo \
    hyprsunset \
    hyprpaper \
    hyprcursor \
    hyprgraphics \
    hyprpolkitagent \
    hyprland-qtutils \
    hyprland-qt-support \
    hyprland-uwsm \
    uwsm \
    pyprland \
    waybar \
    wofi \
    rofi \
    swaync \
    wl-clipboard \
    grim \
    brightnessctl \
    pavucontrol \
    network-manager-applet \
    clipman \
    nwg-drawer \
    wdisplays \
    pavucontrol \
    SwayNotificationCenter \
    NetworkManager-tui \
    tmux \
    ghostty \
    wezterm \
    blueman \
    qt5-qtwayland \
    qt6-qtwayland \
    sddm

# Disable COPRs so they don't end up enabled on the final image:
dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

systemctl enable podman.socket
