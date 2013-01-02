alias ls='ls -FG'
alias ll='ls -FGAlh'
alias la='ls -aG'
alias lv='lv -Ou8'

if [ -x '/usr/local/Cellar/ctags/5.8/bin/ctags' ]; then
  alias ctags='/usr/local/Cellar/ctags/5.8/bin/ctags'
fi

if [ -x '/usr/local/Cellar/gnu-sed/4.2.1/bin/gsed' ]; then
  alias sed='/usr/local/Cellar/gnu-sed/4.2.1/bin/gsed'
fi

if [ -x "`which colordiff`" ]; then
  alias diff=colordiff
fi

source ~/.git-completion.bash

PATH=$PATH:$HOME/src/git-prune-remote-branch
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
