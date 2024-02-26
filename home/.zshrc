# Enable completion
autoload -U compinit
compinit -u
# Add zsh-completions to $fpath
if [ -d "/usr/local/share/zsh-completions" ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi

# match Upper case or/and down case
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

alias gr='grep'
alias le='less'
alias l='ls'
alias ls='ls -FG'
alias ll='ls -FGAlh'
alias la='ls -aG'
alias lv='lv -Ou8'
alias b='bundle'
alias be='bundle exec'
alias bi='bundle install'
alias bo='bundle open'
alias bs='bundle show'
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

alias rec-play='rec /tmp/a.wav; play /tmp/a.wav; rm /tmp/a.wav'
# force ag
#alias grep='ag'

if [ -x '/usr/local/Cellar/ctags/5.8/bin/ctags' ]; then
  alias ctags='/usr/local/Cellar/ctags/5.8/bin/ctags'
fi

if [ -x '/usr/local/Cellar/gnu-sed/4.2.1/bin/gsed' ]; then
  alias sed='/usr/local/Cellar/gnu-sed/4.2.1/bin/gsed'
fi

if [ -x "`which colordiff 2>/dev/null`" ]; then
  alias diff=colordiff
fi

if [ -x "`which terminal-notifier 2>/dev/null`" ]; then
  alias notify=terminal-notifier 
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
function md {
  mkdir -p "$@" && cd "$1"
}

alias v='nvim'
alias c='cd'
function plantuml() { java -jar $HOME/tools/plantuml.jar $1; }

function dict {
  if [ $# -eq 0 ]; then 
    echo "Usage: dict WORD" 1>&2
    return 1
  fi
  open dict://$@
}

if [ -e '/Applications/Xcode.app/Contents/Developer/usr/bin/cvs' ]; then
  alias cvs='/Applications/Xcode.app/Contents/Developer/usr/bin/cvs'
fi

PATH=$PATH:$HOME/src/git-prune-remote-branch
#PATH=$PATH:/usr/local/mysql/bin

#MANPATH=$MANPATH:/usr/local/mysql/man

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
  cd $(ghq list -p | fzf)
}
alias cr=change-repo

# hub
if [ -n "`which hub`" ]; then
  alias git=hub
fi

# direnv
# eval "$(direnv hook bash)"

# nodebrew
# export PATH=$HOME/.nodebrew/current/bin:$PATH

# history
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000

# http://shirusu-ni-tarazu.hatenablog.jp/entry/2013/01/18/034233
setopt nonomatch


# mysql@5.7
export PATH="/opt/homebrew/opt/mysql@5.7/bin:$PATH"
#For compilers to find mysql@5.7 you may need to set:
export LDFLAGS="-L/opt/homebrew/opt/mysql@5.7/lib"                                                                                   
export CPPFLAGS="-I/opt/homebrew/opt/mysql@5.7/include"
#For pkg-config to find mysql@5.7 you may need to set:
export PKG_CONFIG_PATH="/ops/homebrew/opt/mysql@5.7/lib/pkgconfig"


# python
export PATH=$PATH:/opt/homebrew/opt/python@3.10/libexec/bin

# asdf
if [ -d "$HOME/.asdf" ]; then
  # setup asdf
  . "$HOME/.asdf/asdf.sh"

  # append completions to fpath
  fpath=(${ASDF_DIR}/completions $fpath)
  # initialise completions with ZSH's compinit
  autoload -Uz compinit && compinit
fi
