#!/bin/nash

set -e

# Set alt+tab to Switch Windows Directly in shortcut settings

# Set shortcuts for moving between desktops
for i in {1..9}; do
  gsettings set org.gnome.shell.keybindings switch-to-application-$i "[]"
  gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-$i "['<Super>$i']"
  gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-$i "['<Super><Shift>$i']"
done

# Set volume shortcuts

# Set compose key

# Install fzf
sudo dnf install fzf -y

# Install batcat
sudo dnf install bat -y

# Install zsh
sudo dnf install zsh -y

# Install ag
sudo dnf install the_silver_searcher -y

# Install oh-my-zsh
# https://ohmyz.sh/#install
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install dotfiles
~/dotfiles/install

# Install neovim
sudo dnf install neovim -y

# Auth Copilot

# Install duplicity for backup
sudo dnf install duplicity
sudo dnf install python3-pip -y
sudo pip install --upgrade pip
sudo pip install boto

# Enable crontab
# Copy content of crontab in home dir
crontab -e # Paste content

# Disable Caps Lock
sudo dnf install gnome-tweaks -y
# * Gnome Tweaks
# * Keyboard
# * Additional Layout Options
# * Caps Lock behaviour
# * Caps Lock is disabled

# Install asdf: https://asdf-vm.com/guide/getting-started.html#_1-install-asdf

# Install deps for Erlang
# https://github.com/asdf-vm/asdf-erlang?tab=readme-ov-file#centos--fedora
# Build tools
sudo dnf install -y git gcc g++ automake autoconf 
# Terminal handling
sudo dnf install -y ncurses-devel
# Observer
sudo dnf install -y wxGTK-devel wxBase
# SSL
sudo dnf install -y openssl-devel

# Install deps for Ruby
# https://github.com/rbenv/ruby-build/wiki#fedora
sudo dnf install -y autoconf gcc rust patch make bzip2 openssl-devel libyaml-devel libffi-devel readline-devel gdbm-devel ncurses-devel perl-FindBin zlib-ng-compat-devel

# Install plugins
asdf plugin add erlang
asdf plugin add elixir
asdf plugin add nodejs
asdf plugin add ruby
asdf plugin add python

# Install
asdf install

# Install Kitty
sudo dnf install kitty -y

# Make Kitty the shell that starts when pressing Super+T

# Install zoxide
# https://github.com/ajeetdsouza/zoxide?tab=readme-ov-file#installation
sudo dnf install zoxide fzf -y
