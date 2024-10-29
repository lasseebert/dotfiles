#!/bin/nash

set -e

# Set alt+tab to Switch Windows Directly in shortcut settings

# Set shortcuts for moving between desktops
gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.desktop.wm.preferences num-workspaces 9
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 "['<Super>1']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1 "['<Super><Shift>1']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2 "['<Super>2']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-2 "['<Super><Shift>2']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3 "['<Super>3']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-3 "['<Super><Shift>3']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4 "['<Super>4']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-4 "['<Super><Shift>4']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-5 "['<Super>5']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-5 "['<Super><Shift>5']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-6 "['<Super>6']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-6 "['<Super><Shift>6']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-7 "['<Super>7']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-7 "['<Super><Shift>7']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-8 "['<Super>8']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-8 "['<Super><Shift>8']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-9 "['<Super>9']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-9 "['<Super><Shift>9']"

# Set volume shortcuts

# Set compose key

# Install fzf
sudo apt install fzf -y

# Install podman
sudo apt install podman -y

# Install batcat
sudo apt install bat -y

# Install zsh
sudo apt install zsh -y

# Install oh-my-zsh
# https://ohmyz.sh/#install
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install dotfiles
~/dotfiles/install

# Install neovim
# Already in bin. Download latest from https://github.com/neovim/neovim/releases
# Auth Copilot

# Install duplicity for backup
sudo apt install duplicity
sudo apt install python3-pip python3-dev build-essential
sudo pip install --upgrade pip
sudo pip install boto

# Enable crontab
# Copy content of crontab in home dir
crontab -e # Paste content

# Disable Caps Lock
sudo apt install gnome-tweaks -y
# * Gnome Tweaks
# * Keyboard and Mouse
# * Additional Layout Options
# * Caps Lock behaviour
# * Caps Lock is disabled (different from the "Disabled" option)

# Install asdf:
# Install asdf base dependencies
sudo apt install curl git
# Install asdf base
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.1
# Install deps for erlang
sudo apt-get -y install build-essential autoconf m4 libncurses5-dev libgl1-mesa-dev libglu1-mesa-dev libpng-dev libssh-dev unixodbc-dev xsltproc fop libxml2-utils libncurses-dev openjdk-11-jdk
# Should also install libwxgtk3.2-dev libwxgtk-webview3.2-dev, but that package does not exist
# Install plugins
asdf plugin-add erlang
asdf plugin-add elixir
asdf plugin-add nodejs
asdf plugin-add ruby
asdf plugin-add python
# Install
asdf install

# Install Kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
# Make Kitty the shell that starts when pressing Super+T

# Install fonts from https://www.nerdfonts.com/font-downloads
# This is for showing cool icons in Neovim in Kitty
cd ~/Downloads
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/RobotoMono.zip
unzip RobotoMono.zip
sudo mkdir /usr/local/share/fonts/roboto_mono_nerd
sudo cp RobotoMonoNerdFont*.ttf /usr/local/share/fonts/roboto_mono_nerd -v
sudo fc-cache -fv

# Install just

# Restart to make zsh default shell
