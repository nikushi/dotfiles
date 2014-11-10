alias ls='ls -FG'
alias ll='ls -FGAlh'
alias la='ls -aG'
alias lv='lv -Ou8'
alias be='bundle exec'
alias bi='bundle install'
alias g='git'
alias ga='git add'
alias gaa='git add -A'
alias gp='git push'
alias gpush='git push'
alias gci='git commit -m'
alias gdiff='git diff'
alias s='spring'
alias pu='pushd'
alias po='popd'
alias akacurl='curl -o /dev/null -v -H "Pragma: akamai-x-cache-on, akamai-x-cache-remote-on, akamai-x-check-cacheable, akamai-x-get-cache-key, akamai-x-get-extracted-values, akamai-x-get-nonces, akamai-x-get-ssl-client-session-id, akamai-x-get-true-cache-key, akamai-x-serial-no" '
alias chrome="open -a '/Applications/Google Chrome.app'"

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
PATH=$PATH:/usr/local/mysql/bin

MANPATH=$MANPATH:/usr/local/mysql/man


### Added by the Heroku Toolbelt
if [ -d '/usr/local/heroku/bin' ]; then
  export PATH="/usr/local/heroku/bin:$PATH"
fi

# peco + ghq
function change-repo () {
  cd $(ghq list -p | peco)
}
alias cr=change-repo

# hub
if [ -n "`which hub`" ]; then
  alias git=hub
fi
