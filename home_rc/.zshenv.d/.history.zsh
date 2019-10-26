HISTFILE=${HOME}/.zsh_history
HISTSIZE=10000
SAVEHIST=100000

setopt inc_append_history    # 履歴を即時反映
setopt share_history         # 同時に起動したzshの間でヒストリを共有する
setopt hist_ignore_all_dups  # 重複するコマンド行は古い方を削除
# setopt hist_ignore_dups      # 直前と同じコマンドラインはヒストリに追加しない
# setopt hist_no_store         # historyコマンドは履歴に登録しない
setopt hist_reduce_blanks    # 余分な空白は詰めて記録
# setopt hist_expand

function peco-history-selection() {
  BUFFER="$(history -nr 1 | awk '!a[$0]++' | peco --query "$LBUFFER" | sed 's/\\n/\n/')"
  CURSOR=$#BUFFER
  zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection
