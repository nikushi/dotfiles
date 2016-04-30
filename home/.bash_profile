#LANG=ja_JP.UTF-8
export LANG=en_US.UTF-8
export PAGER='/usr/local/bin/lv -Ou8 -c'
export EDITOR='vim'
export HISTSIZE=100000

#export PATH=$PATH:~/bin:/usr/local/sbin
export PATH=~/bin:/usr/local/bin:/usr/local/sbin:$PATH

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
if [ -n "`which go`" ]; then
  export GOROOT=`go env GOROOT`
fi
GOPATH=$HOME
for dir in bin pkg src
do
  if [ ! -d $GOPATH/$dir ]; then
    mkdir $GOPATH/$dir
  fi
done
export GOPATH
export PATH=$PATH:$GOPATH/bin


### Add path to niku4i/binfiles
if [ -d "$HOME/src/github.com/niku4i/binfiles/bin" ]; then
  export PATH="$HOME/src/github.com/niku4i/binfiles/bin:$PATH"
fi



# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=/Users/nikushi/Downloads/cocos2d-x-3.10/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_X_ROOT for cocos2d-x
export COCOS_X_ROOT=/Users/nikushi/Downloads
export PATH=$COCOS_X_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT=/Users/nikushi/Downloads/cocos2d-x-3.10/templates
export PATH=$COCOS_TEMPLATES_ROOT:$PATH
