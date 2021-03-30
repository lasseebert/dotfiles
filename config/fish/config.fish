# The text that is displayed when fish starts
# This is set to empty to not greet at all
set fish_greeting

# Show full path in prompt
# This variable tells the prompt how many chars is visible per path part
set fish_prompt_pwd_dir_length 100

# Editor used in various programs
set -x EDITOR vim

# Enable iex history and Erlang docs
set -x ERL_AFLAGS "-kernel shell_history enabled"
set -x KERL_BUILD_DOCS "yes"

# Add .local/bin to PATH. This is typically where pip installs to
set -x PATH "$HOME/.local/bin" $PATH

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
