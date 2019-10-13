#!/bin/bash

DOTPATH=${HOME}/.dotfiles

pushd $DOTPATH

for file in .??* ; do
  [ "$file" = ".git" ] && continue
  ln -snfv ${DOTPATH}/${file} ${HOME}/${file}
done

popd
