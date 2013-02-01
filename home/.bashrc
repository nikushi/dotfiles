alias ls='ls -FG'
alias ll='ls -FGAlh'
alias la='ls -aG'
alias lv='lv -Ou8'

alias iijping='ping 202.232.0.1'

if [ -x '/usr/local/Cellar/ctags/5.8/bin/ctags' ]; then
  alias ctags='/usr/local/Cellar/ctags/5.8/bin/ctags'
fi

if [ -x '/usr/local/Cellar/gnu-sed/4.2.1/bin/gsed' ]; then
  alias sed='/usr/local/Cellar/gnu-sed/4.2.1/bin/gsed'
fi

if [ -x "`which colordiff 2>/dev/null`" ]; then
  alias diff=colordiff
fi

if [ -d '~/.bash_completion.d' ]; then
  for file in ~/.bash_completion.d/*bash ; do
    source $file
  done
fi

PATH=$PATH:$HOME/src/git-prune-remote-branch
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
