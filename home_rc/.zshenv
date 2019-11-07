export LANG=ja_JP.UTF-8
export LESS='-igSMRXF'

path=(
  /usr/local/share/git-core/contrib/diff-highlight
  $path
)

#####
# history
#####
HISTFILE=${HOME}/.zsh_history
HISTSIZE=10000
SAVEHIST=100000

# http://oomatomo.hatenablog.com/entry/36401841
# setopt bang_hist            # !を使った履歴展開を行う(d)
# setopt extended_history     # 履歴に実行時間も保存する
# setopt hist_ignore_dups     # 直前と同じコマンドは履歴に追加しない
# setopt hist_reduce_blanks   # 余分なスペースを削除して履歴に保存する
# setopt hist_no_store        # historyコマンドは履歴に登録しない
# setopt hist_expand          # 補完時に履歴を自動的に展開
# setopt hist_ignore_dups     # 入力したコマンドが直前のものと同一なら履歴に登録しない
# setopt hist_save_no_dups    # 入力したコマンドが直前のものと同一なら古いコマンドのほうを削除する
# setopt hist_find_no_dups    # ラインエディタでヒストリ検索し、ヒットした場合でも重複したものとみなさない
# setopt hist_ignore_all_dups # 入力したコマンドを履歴に登録する時、同一がすでに存在した場合登録しない
# setopt hist_no_functions    # 関数定義のためのコマンドは履歴から削除する
# setopt hist_no_store        # 履歴参照のコマンドは履歴に登録しない
# setopt hist_reduce_blanks   # コマンド中の余分な空白を削除する
# setopt inc_append_history   # 履歴をインクリメンタルに追加
# setopt share_history        # 他のシェルのヒストリをリアルタイムで共有する

setopt inc_append_history    # 履歴を即時反映
setopt share_history         # 同時に起動したzshの間でヒストリを共有する
setopt hist_ignore_all_dups  # 重複するコマンド行は削除
setopt hist_ignore_dups      # 直前と同じコマンドラインはヒストリに追加しない
setopt hist_no_store         # historyコマンドは履歴に登録しない
setopt hist_reduce_blanks    # 余分な空白は詰めて記録
setopt hist_expand           # 補完時に履歴を自動的に展開 (?)
setopt hist_no_functions    # 関数定義のためのコマンドは履歴から削除する

# function peco-history-selection() {
#   BUFFER="$(history -nr 1 | awk '!a[$0]++' | peco --query "$LBUFFER")"
#   CURSOR=$#BUFFER
#   zle reset-prompt
# }

# zle -N peco-history-selection
# bindkey '^R' peco-history-selection
