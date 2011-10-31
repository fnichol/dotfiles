if command -v qw >/dev/null ; then
  alias qw="qw -e ${EDITOR%% *}"
fi

if command -v git >/dev/null ; then
  alias gap="git add -p"
  alias gci="git commit -v"
  alias gd="git diff"
  alias gg="git graph"
  alias gl="git log"
  alias gpu="git push"
  alias gst="git status"
fi

if command -v git-flow >/dev/null ; then
  alias gf="git flow"
fi

alias mvim-light="mvim '+colorscheme solarized' '+set background=light'"
alias vim-light="vim '+colorscheme solarized' '+set background=light'"
