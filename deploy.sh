#!/bin/bash

DOTPATH=${HOME}/.dotfiles

pushd $DOTPATH

for file in .??* ; do
  # 頭に.がついているファイルが対象だが
  # [ -d $file ] && continue # ディレクトリは無視する
  [ "$file" = ".git" ] && continue # .gitは無視する

  ln -snfv ${DOTPATH}/${file} ${HOME}/${file}
done

unset file

popd
