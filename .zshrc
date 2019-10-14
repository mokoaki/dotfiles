# インタラクティブシェル（ログインシェルとしてではない）としてzshが起動された場合に読み込まれる
# リスト
# /etc/zshenv
# ~/.zshenv
# /etc/zshrc
# ~/.zshrc

# export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"
eval "$(nodenv init - zsh)"
