# インタラクティブシェル（ログインシェルとしてではない）としてzshが起動された場合に読み込まれるリスト

# /etc/zshenv
# ~/.zshenv
# /etc/zshrc
# ~/.zshrc

export LANG=ja_JP.UTF-8

# export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"
eval "$(nodenv init - zsh)"
