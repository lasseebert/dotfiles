# The text that is displayed when fish starts
# This is set to empty to not greet at all
set fish_greeting

# Editor used in various programs
set -x EDITOR vim

# Set up asdf
source ~/.asdf/asdf.fish

# Enable iex history
set -x ERL_AFLAGS $ERL_AFLAGS "-kernel shell_history enabled"

# Wow. Such doge. Very zsh. Many terminal. Wow
# https://github.com/thiderman/doge
which doge > /dev/null ;and doge
