if command -v qw >/dev/null ; then
  alias qw="qw -e ${EDITOR%% *}"
fi

if command -v git >/dev/null ; then
  alias gap="git add -p"
  alias gci="git commit -v"
  alias gd="git diff"
  alias gg="git graph"
  alias gl="git log"
  alias gp="git push origin HEAD"
  alias gst="git status"
fi

alias mvim-light="mvim '+colorscheme solarized' '+set background=light'"
alias vim-light="vim '+colorscheme solarized' '+set background=light'"
alias mvim='open -a MacVim'

if command -v tmux >/dev/null ; then
  alias tn='tmux new -s "$(basename `pwd`)" || tmux at -t "$(basename `pwd`)"'
  alias ta='tmux attach'
fi

alias fruns='bin/foreman run rails s'
alias frunc='bin/foreman run rails c'
alias frun='bin/foreman run'
alias bi="bundle install"
alias fack='ack -f | ack '
