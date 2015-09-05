# Enable completion
autoload -U compinit
compinit

# match Upper case or/and down case
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

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
alias akacurl='curl -o /dev/null -v -H "Pragma: akamai-x-cache-on, akamai-x-cache-remote-on, akamai-x-check-cacheable, akamai-x-get-cache-key, akamai-x-get-extracted-values, akamai-x-get-nonces, akamai-x-get-ssl-client-session-id, akamai-x-get-true-cache-key, akamai-x-serial-no" '
alias chrome="open -a '/Applications/Google Chrome.app'"

alias iijping='ping 202.232.0.1'
# Workaround. ref: https://github.com/robbyrussell/oh-my-zsh/issues/433
alias rake='noglob rake'

if [ -x '/usr/local/Cellar/ctags/5.8/bin/ctags' ]; then
  alias ctags='/usr/local/Cellar/ctags/5.8/bin/ctags'
fi

if [ -x '/usr/local/Cellar/gnu-sed/4.2.1/bin/gsed' ]; then
  alias sed='/usr/local/Cellar/gnu-sed/4.2.1/bin/gsed'
fi

if [ -x "`which colordiff 2>/dev/null`" ]; then
  alias diff=colordiff
fi

function mycd {
  if [ -n "$1" ]; then
    pushd $1
  else
    pushd ~/
  fi
}
alias cd=mycd
compdef _cd mycd
alias po='popd'
alias  p='popd'

if [ -e '/Applications/Xcode.app/Contents/Developer/usr/bin/cvs' ]; then
  alias cvs='/Applications/Xcode.app/Contents/Developer/usr/bin/cvs'
fi

PATH=$PATH:$HOME/src/git-prune-remote-branch
PATH=$PATH:/usr/local/mysql/bin

MANPATH=$MANPATH:/usr/local/mysql/man

# Enalbe ^p and ^n
bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search
# Enalbe ^a and ^e
bindkey -e

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

# direnv
eval "$(direnv hook bash)"

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# history
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000

