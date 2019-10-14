# ログインシェルとしてzshが起動された場合に読み込まれる
# リスト
# /etc/zshenv
# ~/.zshenv
# /etc/zprofile
# ~/.zprofile
# /etc/zshrc
# ~/.zshrc
# /etc/zlogin
# ~/.zlogin

# 補完 compilation
autoload -U compinit; compinit

fragments_dir=".zsh.d"
if [ -d ${fragments_dir} ] ; then
  for file in ${fragments_dir}/.??* ; do
    . $file
  done
  unset file
fi
