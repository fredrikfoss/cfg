# Fedora Minimal Setup

FIXME: Everything.

Set up a Linux development environment with Fedora Minimal, Wayland and Sway.

## Install Fedora Minimal

- Fedora Minimal Raw \
  <https://fedoraproject.org/spins/minimal/download>

- Fedora Everything Network Install \
  <https://fedoraproject.org/everything/download>

- Asahi Linux \
  <https://asahilinux.org>

## Connect to wireless network

NetworkManager is enabled by default. To connect to a wireless network:

```sh
nmcli device wifi list                         # list available networks
nmcli --ask device wifi connect <network-ssid> # connect to network
```

To speed up package installation, install `dnf5` and edit `dnf.conf`:

```sh
sudo dnf copr enable rpmsoftwaremanagement/dnf-nightly
sudo dnf -y install dnf5

echo 'fastestmirror=True' | sudo tee --append /etc/dnf/dnf.conf
echo 'max_parallel_downloads=20' | sudo tee --append /etc/dnf/dnf.conf
```

Update packages:

```sh
sudo dnf5 -y upgrade --refresh
```

<!--
Allow virtual machines that use fusefs to install properly with SELinux:

```sh
sudo setsebool -P virt_use_fusefs 1
```
-->

## Packages

```sh
# Desktop environment
sudo dnf5 -y install sway                   # window manager
sudo dnf5 -y install foot                   # terminal
sudo dnf5 -y install pipewire wireplumber   # multimedia server
sudo dnf5 -y install waypipe                # remote display
sudo dnf5 -y install libnotify mako         # desktop notification
sudo dnf5 -y install j4-dmenu-desktop       # find .desktop files
sudo dnf5 -y install wmenu                  # dynamic menu
sudo dnf5 -y install brightnessctl          # backlight control
sudo dnf5 -y install playerctl              # media control
sudo dnf5 -y install network-manager-applet # networkmanager applet
sudo dnf5 -y install grim                   # screenshot tool
sudo dnf5 -y install slurp                  # region selection tool
sudo dnf5 -y install wf-recorder            # screen recorder
# sudo dnf5 -y install wf-screenrec         # replacement for above, but not yet in dnf repos
sudo dnf5 -y install wl-clipboard           # clipboard
sudo dnf5 -y install bluez                  # bluetooth
sudo dnf5 -y install bluez-tools            # bluetooth tools
sudo dnf5 -y install blueman                # bluetooth manager
sudo dnf5 -y install htop
sudo dnf5 -y install powertop
# sudo dnf5 -y install greetd               # login manager

# Status bar
sudo dnf -y copr enable atim/i3status-rust
sudo dnf5 -y install i3status-rust

# Misc
sudo dnf5 -y install firefox                # browser
sudo dnf5 -y install thunar                 # file manager
sudo dnf5 -y install imv                    # image viewer
sudo dnf5 -y install mpv                    # video/audio player
sudo dnf5 -y install zathura-pdf-mupdf      # PDF viewer
sudo dnf5 -y install fswatch                # file watcher backend
sudo dnf5 -y install gvfs                   # virtual filesystem
sudo dnf5 -y install udisks                 # disk management
sudo dnf5 -y install gvfs-smb               # SMB support for GVFS
sudo dnf5 -y install ncspot                 # spotify client
sudo dnf5 -y install darkman                # dark mode manager
sudo dnf5 -y install qalculate              # calculator
sudo dnf5 -y install qalculate-gtk          # calculator
sudo dnf5 -y install wtype                  # keyboard typing simulation
sudo dnf5 -y install fastfetch
sudo dnf5 -y install croc                   # file transfer tool
sudo dnf5 -y install jq
sudo dnf5 -y install yq
sudo dnf5 -y install pass
sudo dnf5 -y install qrencode
sudo dnf5 -y install zbar
# sudo dnf5 -y install swappy               # TODO: snapshot editor tool: grim -g "$(slurp)" - | swappy -f -

# Neovim and deps.
sudo dnf5 install -y fswatch
sudo dnf5 install -y ripgrep
sudo dnf5 install -y fd-find
sudo dnf copr enable agriffis/neovim-nightly
sudo dnf5 install -y neovim python3-neovim
```

### Codecs and stuff

```sh
# Enable widevine (maybe asahi only)
sudo dnf5 -y install widevine-installer
widevine-installer

# Enable RPM Fusion repos and install codecs
sudo dnf5 -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf5 -y install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf config-manager --enable fedora-cisco-openh264
sudo dnf group update core
sudo dnf5 -y install libavcodec-freeworld
```

### Development

```sh
sudo dnf5 install moreutils
sudo dnf5 install java-latest-openjdk
sudo dnf5 install lua
sudo dnf5 install go
sudo dnf5 install rust
sudo dnf5 install cargo
sudo dnf5 install pipx
sudo dnf5 install just
sudo dnf5 install clang
sudo dnf5 install clang-tools-extra
sudo dnf5 install gtkwave
sudo dnf5 install ghdl
```

### Maybe

- hyprland copr
- protonvpn copr
- signal messenger copr
- Docker
- Ansible
- Nix

## Locales

TODO: Look into further.

Set locales settings. See <https://wiki.archlinux.org/title/Locale>.

Which one: <https://sourceware.org/glibc/wiki/Proposals/C.UTF-8>.

```
localectl set-locale C.UTF-8
```

See:
  - `/etc/locale.conf`
  - locale(7)
  - locale(5)

## Related

- <https://redd.it/1ebxxu5>
- <https://rpmfusion.org/configuration>
- <https://docs.fedoraproject.org/en-US/fedora-asahi-remix/faq>
- <https://docs.fedoraproject.org/en-US/quick-docs/rpmfusion-setup>
