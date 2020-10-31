#!/usr/bin/env bash

if command -v git >/dev/null; then
  alias gap="git add -p"
  alias gci="git commit --signoff -v"
  alias gd="git diff"
  alias gg="git graph"
  alias gl="git log"
  alias gp="git push origin HEAD"
  alias gst="git status"
fi

if command -v tmux >/dev/null; then
  alias tn='tmux new -s "$(basename `pwd` | sed 's/\\\\./-/g')" || tmux at -t "$(basename `pwd` | sed 's/\\\\./-/g')"'
  alias ta='tmux attach'
fi
