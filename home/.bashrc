if ! shopt -q login_shell || [[ -n "$SSH_CLIENT" ]] ; then
  if    [[ -f "$HOME/.bash/bashrc" ]] ; then . $HOME/.bash/bashrc
  elif  [[ -f "/etc/bash/bashrc" ]]   ; then . /etc/bash/bashrc
  fi
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/usr/local/share/npm/bin:$PATH"
