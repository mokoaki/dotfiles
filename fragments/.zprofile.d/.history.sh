HISTFILE=${HOME}/.zsh_history
HISTSIZE=10000
SAVEHIST=100000

setopt share_history         # 同時に起動したzshの間でヒストリを共有する
setopt hist_ignore_all_dups  # 重複するコマンド行は古い方を削除
setopt hist_ignore_dups      # 直前と同じコマンドラインはヒストリに追加しない
setopt inc_append_history    # 履歴を即時反映
setopt hist_no_store         # historyコマンドは履歴に登録しない
setopt hist_reduce_blanks    # 余分な空白は詰めて記録
# setopt hist_expand

# 途中までコマンドを入力してCTRL+pからの[CTRL+p || CTRL+n]
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
