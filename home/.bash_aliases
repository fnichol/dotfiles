#!/usr/bin/env bash

if command -v git >/dev/null; then
  # Git aliases are specified in `~/.gitconfig`
  alias gap="git ap"
  alias gci="git ci"
  alias gd="git d"
  alias gg="git g"
  alias gl="git l"
  alias gst="git st"
fi

if command -v tmux >/dev/null; then
  alias tn='tmux new -s "$(basename `pwd` | sed 's/\\\\./-/g')" || tmux at -t "$(basename `pwd` | sed 's/\\\\./-/g')"'
  alias ta='tmux attach'
fi
