# The text that is displayed when fish starts
# This is set to empty to not greet at all
set fish_greeting

# Show full path in prompt
# This variable tells the prompt how many chars is visible per path part
set fish_prompt_pwd_dir_length 100

# Editor used in various programs
set -x EDITOR vim

# Enable iex history
set -x ERL_AFLAGS "-kernel shell_history enabled"

# Set up asdf
source ~/.asdf/asdf.fish

# Wow. Such doge. Very zsh. Many terminal. Wow
# https://github.com/thiderman/doge
which doge > /dev/null ;and doge
