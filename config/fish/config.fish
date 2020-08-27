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

# Add personal bin folder to PATH
set -x PATH "$HOME/bin" $PATH

# Set up asdf
if test -d ~/.asdf
  source ~/.asdf/asdf.fish
end

# Setup fzf
fzf_key_bindings

# GPG
set -x GPG_TTY (tty)
