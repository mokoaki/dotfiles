# 補完 compilation
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select interactive
setopt menu_complete

# ディレクトリ名を入力するだけで移動
setopt auto_cd

# 移動したディレクトリを記録しておく。"cd -[Tab]"で移動履歴を一覧
setopt auto_pushd

# コマンド訂正を依頼
setopt correct

# 補完候補を詰めて表示する
# setopt list_packed

# 補完候補表示時などにピッピとビープ音をならないように設定
#setopt nolistbeep

# パス補完時に最後のスラッシュを削除しなくていいです
setopt noautoremoveslash
