export LANG=en_US.UTF-8
export PAGER='/usr/local/bin/lv -Ou8 -c'
export EDITOR='nvim'
export HISTSIZE=100000

export PATH=~/bin:/usr/local/bin:/usr/local/sbin:$PATH

# change prompt's color
#PROMPT='%F{6}%m %1~ %# %f'
PROMPT='%F{6}%m %1~ %(!.#.$) %f'
RPROMPT='[%~]'
setopt transient_rprompt

if [ -f ~/.zprofile.local ]; then
    source ~/.zprofile.local
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
export GOBIN=$GOPATH/bin


### Add path to nikushi/binfiles
if [ -d "$HOME/src/github.com/nikushi/binfiles/bin" ]; then
  export PATH="$HOME/src/github.com/nikushi/binfiles/bin:$PATH"
fi

# Android NDK
if [ -d "$HOME/Android_SDK/NDK" ]; then
  export PATH="$HOME/Android_SDK/NDK:$PATH" 
fi


# ndenv
export PATH="$HOME/.ndenv/bin:$PATH"
eval "$(ndenv init -)"
export PATH="$HOME/.ndenv/shims:$PATH"

# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
