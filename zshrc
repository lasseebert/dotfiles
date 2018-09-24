# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

if [ "$HOME" = "/home/pulver" ]
then
  local_computer=true
else
  local_computer=false
fi

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
if [ "$local_computer" = true ]
then
  ZSH_THEME="lasseebert"
else
  ZSH_THEME="lasseebert-remote"
fi


alias o="gio open"
alias bower='noglob bower'
alias time="/usr/bin/time"

# Vim like commands
alias :q="exit"

# Vagrant
alias vh="vagrant halt"
alias vu="vagrant up"
alias vssh="vagrant ssh"
alias vussh="vagrant up && vagrant ssh"
alias vhussh="vagrant halt && vagrant up && vagrant ssh"

# ag, the silver searcher
alias ag="ag --skip-vcs-ignores"

# Use Neovim over Vim if available
if which nvim > /dev/null; then
  REAL_VIM=$(which nvim)
  alias vim=$REAL_VIM
else
  REAL_VIM=$(which vim)
fi
export EDITOR=$REAL_VIM

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
if [ "$local_computer" = true ]
then
  plugins=(
    bundler
    git
    lasseebert-common
    mix
    rake
    ssh-agent
    vagrant
    zsh-syntax-highlighting
  )
else
  plugins=(
    bundler
    git
    lasseebert-common
    mix
    rake
  )
fi

zstyle :omz:plugins:ssh-agent agent-forwarding on

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

# History search
[[ -n "${key[Up]}" ]] && bindkey "${key[Up]}" history-beginning-search-backward
[[ -n "${key[Down]}" ]] && bindkey "${key[Down]}" history-beginning-search-forward

# Customize to your needs...
export PATH=/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/pulver/bin:/home/pulver/bin/terminals

export PATH="$PATH:$HOME/bin/AWS-ElasticBeanstalk-CLI-2.4.0/eb/linux/python2.7/"

# asdf - manage versions of different programming languages
[[ -d $HOME/.asdf ]] && . $HOME/.asdf/asdf.sh

# Wow. Such doge. Very zsh. Many terminal. Wow
# https://github.com/thiderman/doge
which doge > /dev/null && doge

# For tmux
export TERM="xterm-256color"

# Map carriage return to newline
stty icrnl

# Enable history in erlang and elixir
export ERL_AFLAGS="-kernel shell_history enabled"
