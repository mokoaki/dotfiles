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

fragments_dir=~/.dotfiles/fragments/.zprofile.d

if [ -d $fragments_dir ] ; then
  for file in $fragments_dir/.??*.sh ; do
    [ -d $file ] && continue
    . $file
  done
  unset file
fi

echo "loaded ~/.zprofile"