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

script_directory=`pwd`
fragments_dir=${script_directory}/fragments/.zprofile.d
# 分割ファイルを読みこむ
if [ -d $fragments_dir ] ; then
  for file in $fragments_dir/.??*.sh ; do
    [ -d $file ] && continue
    . $file
  done
  unset file
fi
