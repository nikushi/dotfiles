#LANG=ja_JP.UTF-8
export LANG=en_US.UTF-8
export PAGER='/usr/local/bin/lv -Ou8 -c'
export EDITOR='/usr/bin/vim'
export HISTSIZE=100000

export PATH=$PATH:~/bin:/usr/local/sbin

# change prompt's color
export PS1='\[\033[0;36m\]\h\[\033[1;33m\] \w \[\033[0;37m\]\$ \[\033[00m\]'

if [ -f ~/.bash_profile.local ]; then
    source ~/.bash_profile.local
fi

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

if [ -f ~/perl5/perlbrew/etc/bashrc ]; then
    # Quick Hack to surpress warn message of 
    # Use of uninitialized value in split 
    # at /loader/0x7ffb418523f8/local/lib.pm line 8.
    # see detail https://github.com/gugod/App-perlbrew/issues/235
    [ -z "$PERL5LIB" ] && export PERL5LIB=""
    source ~/perl5/perlbrew/etc/bashrc
fi

# rbenv
export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init -)"

# GOPATH
GOPATH=~/go
if [ ! -d $GOPATH ]; then
  mkdir $GOPATH
  mkdir $GOPATH/bin
  mkdir $GOPATH/pkg
  mkdir $GOPATH/src
fi
export GOPATH
export PATH=$PATH:$GOPATH/bin
