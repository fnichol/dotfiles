#!/usr/bin/env bash

if ! shopt -q login_shell || [[ -n "$SSH_CLIENT" ]]; then
  if [[ -f "$HOME/.bash/bashrc" ]]; then
    # shellcheck source=/dev/null
    . "$HOME/.bash/bashrc"
  elif [[ -f "/etc/bash/bashrc" ]]; then
    # shellcheck source=/dev/null
    . /etc/bash/bashrc
  fi
fi
