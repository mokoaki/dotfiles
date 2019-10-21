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

fragments_dir=./fragments/.zprofile.d

if [ -d $fragments_dir ] ; then
  echo -n "loaded"

  for file in $fragments_dir/.??*.sh ; do
    [ -d $file ] && continue
    . $file
    echo -n " `basename $file`"
  done

  unset file

  echo
fi

echo "loaded ~/.zprofile"
