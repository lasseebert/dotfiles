# Thanks to Claus Witt for this
# http://clauswitt.com

# Git aliases
alias gitst='git status --short'
alias gitc='git commit '
alias gitclean='git clean -f'
alias gitl='git l'
 
# Git function to add last parameter of last command via git add (used after a diff)
gital() {
  last_command=$history[$[HISTCMD-1]];
  last_command_array=("${(s/ /)last_command}")
  echo $last_command_array[-1];
  git add $last_command_array[-1];
}
 
# Git function to checkout last parameter of last command via git checkout
gitcl() {
  last_command=$history[$[HISTCMD-1]];
  last_command_array=("${(s/ /)last_command}")
  echo $last_command_array[-1];
  git checkout $last_command_array[-1];
}
 
# Git function to run diff on a file
gitd() {
  git diff $1
}
 
# Get autocomplete options for gdl command
_gitdiff () {
    compadd `git status --short | awk '{print $2}'`
}
compdef _gitdiff gitd
