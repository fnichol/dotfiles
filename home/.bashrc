if ! shopt -q login_shell || [[ -n "$SSH_CLIENT" ]] ; then
  if    [[ -f "$HOME/.bash/bashrc" ]] ; then . $HOME/.bash/bashrc
  elif  [[ -f "/etc/bash/bashrc" ]]   ; then . /etc/bash/bashrc
  fi
fi
