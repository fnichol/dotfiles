export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
 
if [[ -s "${HOME}/.bash/bashrc" ]] ; then
  bashrc_local_install=1
  bashrc_prefix="${HOME}/.bash"
  export bashrc_local_install bashrc_prefix
  source "${bashrc_prefix}/bashrc"
fi

export EDITOR='vim'
