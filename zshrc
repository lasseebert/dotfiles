# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="lasseebert"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias o="gio open"
alias bower='noglob bower'
alias rake="noglob rake"
alias time="/usr/bin/time"

# Vim like commands
alias :q="exit"

# Vagrant
alias vh="vagrant halt"
alias vu="vagrant up"
alias vssh="vagrant ssh"
alias vussh="vagrant up && vagrant ssh"
alias vhussh="vagrant halt && vagrant up && vagrant ssh"

# Window manager
alias w1="swm resize --x 0 --y 0 --width 60 --height 60"
alias w2="swm resize --x 65 --y 0 --width 35 --height 40"
alias w3="swm resize --x 0 --y 60 --width 35 --height 40"
alias w4="swm resize --x 40 --y 40 --width 60 --height 60"
alias w5="swm resize --x 10 --y 10 --width 80 --height 80"

# Use Neovim over Vim if available
if which nvim > /dev/null; then
  REAL_VIM=$(which nvim)
else
  REAL_VIM=$(which vim)
fi
export EDITOR=$REAL_VIM
alias vim=$REAL_VIM

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
plugins=(git bundler rails gem rake lasseebert-git lasseebert-common vagrant mix ssh-agent)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

# History search
[[ -n "${key[Up]}" ]] && bindkey "${key[Up]}" history-beginning-search-backward
[[ -n "${key[Down]}" ]] && bindkey "${key[Down]}" history-beginning-search-forward

# Customize to your needs...
export PATH=/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/pulver/bin:/home/pulver/bin/terminals

export PATH="$PATH:$HOME/bin/AWS-ElasticBeanstalk-CLI-2.4.0/eb/linux/python2.7/"

# chruby
if [[ -d /usr/local/share/chruby ]]; then
  source /usr/local/share/chruby/chruby.sh
  source /usr/local/share/chruby/auto.sh
fi

# rbenv
if [[ -d "$HOME/.rbenv/bin" ]]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init - zsh)"
fi

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# asdf - manage versions of different programming languages
[[ -d $HOME/.asdf ]] && . $HOME/.asdf/asdf.sh

# Jumps
export MARKPATH=$HOME/.marks
function jump {
    cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}
function mark {
    mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}
function unmark {
    rm -i "$MARKPATH/$1"
}
function marks {
    ls -l "$MARKPATH" | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
}
function _completemarks {
  reply=($(ls $MARKPATH))
}
compctl -K _completemarks jump
compctl -K _completemarks unmark



# Wow. Such doge. Very zsh. Many terminal. Wow
# https://github.com/thiderman/doge
which doge > /dev/null && doge

# For tmux
export TERM="xterm-256color"

# Map carriage return to newline
stty icrnl

# Enable history in erlang and elixir
export ERL_AFLAGS="-kernel shell_history enabled"
