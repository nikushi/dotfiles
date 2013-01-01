#LANG=ja_JP.UTF-8
export LANG=en_US.UTF-8
export PAGER='/usr/local/bin/lv -Ou8 -c'
export EDITOR='/usr/bin/vim'
export HISTSIZE=100000

export PATH=$PATH:~/bin:/usr/local/sbin

# change prompt's color
export PS1='\[\033[01;32m\]\h\[\033[01;34m\] \w \$ \[\033[00m\]'

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

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
