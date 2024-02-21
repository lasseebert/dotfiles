#!/bin/nash

set -e

# Set alt+tab to Switch Windows Directly in shortcut settings

# Set shortcuts for moving between desktops
# gsettings set org.gnome.mutter dynamic-workspaces false
# gsettings set org.gnome.desktop.wm.preferences num-workspaces 9
# gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 "['<Super>1']"
# gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1 "['<Super><Shift>1']"
# gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2 "['<Super>2']"
# gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-2 "['<Super><Shift>2']"
# gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3 "['<Super>3']"
# gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-3 "['<Super><Shift>3']"
# gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4 "['<Super>4']"
# gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-4 "['<Super><Shift>4']"
# gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-5 "['<Super>5']"
# gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-5 "['<Super><Shift>5']"
# gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-6 "['<Super>6']"
# gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-6 "['<Super><Shift>6']"
# gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-7 "['<Super>7']"
# gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-7 "['<Super><Shift>7']"
# gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-8 "['<Super>8']"
# gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-8 "['<Super><Shift>8']"
# gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-9 "['<Super>9']"
# gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-9 "['<Super><Shift>9']"

# Install fzf
sudo apt install fzf -y

# Install podman
sudo apt install podman -y

# Install batcat
sudo apt install bat -y

# Install zsh

# Install oh-my-zsh

# Install dotfiles

# Install neovim

# Install duplicity for backup
sudo apt install duplicity
sudo apt install python3-pip python3-dev build-essential
sudo pip install --upgrade pip
sudo pip install boto

# Enable crontab

# Disable Caps Lock
sudo apt install gnome-tweaks -y
# * Gnome Tweaks
# * Keyboard and Mouse
# * Additional Layout Options
# * Caps Lock behaviour
# * Caps Lock is disabled (different from the "Disabled" option)

# Install asdf:
# Install asdf base dependencies
# Install asdf base
# Install deps for erlang
# Install plugins
# asdf install

# -------

# Set volume shortcuts
# Install Kitty
# Install just
# Install Copilot
