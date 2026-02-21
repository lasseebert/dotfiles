# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/pulver/.oh-my-zsh"

# Downgrade openssl for Ruby
# export PATH=$HOME/openssl1/bin:$PATH
# export LD_LIBRARY_PATH=$HOME/openssl1/lib
# export LC_ALL="en_US.UTF-8"
# export LDFLAGS="-L /home/pulver/openssl1/lib -Wl,-rpath,/home/pulver/openssl1/lib"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="lasseebert"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#
# git: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git
# fzf: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/fzf
# mix: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/mix
# timer: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/timer
# asdf: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/asdf
# lasseebert: Custom functions
plugins=(
  git
  fzf
  mix
  timer
  asdf
  lasseebert
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

 export EDITOR='vim'

# Enable iex history and Erlang docs
export ERL_AFLAGS="-kernel shell_history enabled"
export KERL_BUILD_DOCS="yes"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias :q="exit"
alias cat="batcat"
alias o="gio open"
alias copy="xclip -selection clipboard"
alias gh="git_home.sh"
# . "/home/pulver/.acme.sh/acme.sh.env"

# Rubocop options for ruby development
export RUBOCOP_OPTS="--server"

# Ruby executables
export PATH=$HOME/.local/share/gem/ruby/3.3.0/bin:$PATH

# Make GPG work in TTY
export GPG_TTY=$(tty)

# Kitty
export PATH=$HOME/.local/kitty.app/bin:$PATH

# There are a few scripts in the dotfiles
export PATH=$HOME/dotfiles/bin:$PATH

# Install in .local/bin
export PATH=$HOME/.local/bin:$PATH

# Direnv
if which direnv > /dev/null; then
  eval "$(direnv hook zsh)"
fi

# Zoxide
eval "$(zoxide init zsh)"
