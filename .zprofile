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

# 分割ファイルを読みこむ
fragments_dir="./.zprofile.d"
if [ -d $fragments_dir ] ; then
  for file in $fragments_dir/.??* ; do
    [ -d $file ] && continue
    . $file
  done
  unset file
fi
