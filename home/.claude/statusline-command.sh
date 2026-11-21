#!/bin/sh
# Claude Code status line
#   表示: <dir> <branch>[*] <model> <used>k/<size>k (<pct>%)
#   色(ANSI 16 色のみ / Solarized パレットに乗せる。herdr の配色ルールと統一):
#     dir=cyan  branch=lightmagenta(violet)  dirty "*"=yellow
#     model/context=darkgray(補助)  context は 60%+ yellow / 80%+ lightred
#   dir: ~/src/<host>/<org>/<repo>[/sub...] は <org>/<repo>[/sub...]、それ以外は basename

input=$(cat)
dir=$(printf '%s' "$input" | jq -r '.workspace.current_dir // .cwd // empty')
dir=${dir%/}
model=$(printf '%s' "$input" | jq -r '.model.display_name // empty')
pct=$(printf '%s' "$input" | jq -r '.context_window.used_percentage // empty')
size=$(printf '%s' "$input" | jq -r '.context_window.context_window_size // empty')
used=$(printf '%s' "$input" | jq -r '.context_window.current_usage | if . then (.input_tokens + .cache_creation_input_tokens + .cache_read_input_tokens) else empty end')

C_DIR='\033[36m'; C_BR='\033[95m'; C_DIRTY='\033[33m'; C_DIM='\033[90m'
C_WARN='\033[33m'; C_CRIT='\033[91m'; R='\033[0m'

# ---- directory ----
case "$dir" in
  "$HOME"/src/*/*/*)
    rel=${dir#"$HOME"/src/*/}          # <org>/<repo>[/sub...]
    label=$rel ;;
  *) label=$(basename "$dir") ;;
esac
out=$(printf "${C_DIR}%s${R}" "$label")

# ---- git branch ----
if [ -n "$dir" ] && br=$(git -C "$dir" --no-optional-locks branch --show-current 2>/dev/null) && [ -n "$br" ]; then
  out="$out $(printf "${C_BR}%s${R}" "$br")"
  if [ -n "$(git -C "$dir" --no-optional-locks status --porcelain 2>/dev/null | head -1)" ]; then
    out="$out$(printf "${C_DIRTY}*${R}")"
  fi
fi

# ---- model ----
[ -n "$model" ] && out="$out $(printf "${C_DIM}%s${R}" "$model")"

# ---- context ----
if [ -n "$pct" ]; then
  p=$(printf '%.0f' "$pct")
  c=$C_DIM; [ "$p" -ge 60 ] && c=$C_WARN; [ "$p" -ge 80 ] && c=$C_CRIT
  if [ -n "$size" ]; then
    if [ -n "$used" ]; then used_k=$(awk -v u="$used" 'BEGIN{printf "%.0f", u/1000}'); else used_k=$(awk -v p="$pct" -v s="$size" 'BEGIN{printf "%.0f", p*s/100/1000}'); fi
    size_k=$(awk -v s="$size" 'BEGIN{printf "%.0f", s/1000}')
    ctx="${used_k}k/${size_k}k (${p}%)"
  else
    ctx="${p}%"
  fi
  out="$out $(printf "${c}%s${R}" "$ctx")"
fi

printf '%s' "$out"
