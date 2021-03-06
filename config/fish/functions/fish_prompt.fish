function fish_prompt --description 'Write out the prompt'
  set -l last_status $status

  # User
  set_color $fish_color_user
  echo -n (whoami)
  set_color normal

  echo -n '@'

  # Host
  set_color $fish_color_host
  echo -n (prompt_hostname)
  set_color normal

  echo -n ':'

  # PWD
  set_color $fish_color_cwd
  echo -n (prompt_pwd)
  set_color normal

  # Only show git prompt on my host machine
  if test $USER = "pulver"
    __terlar_git_prompt
  end
  echo

  if not test $last_status -eq 0
    set_color $fish_color_error
    echo -n "($last_status)"
  end

  echo -n '➤ '
  set_color normal
end
