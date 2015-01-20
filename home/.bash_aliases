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

if command -v tmux >/dev/null ; then
  alias tn='tmux new -s "$(basename `pwd` | sed 's/\\\\./-/g')" || tmux at -t "$(basename `pwd` | sed 's/\\\\./-/g')"'
  alias ta='tmux attach'
fi

alias kl='kitchen list'
alias kc='kitchen converge'
alias ks='kitchen setup'
alias kv='kitchen verify'
alias kd='kitchen destroy'

# upgrade to the latest ChefDK release
alias upgrade_chefdk='curl -L https://www.chef.io/chef/install.sh | sudo bash -s -- -P chefdk'
