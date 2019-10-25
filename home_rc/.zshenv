fragments_dir=${HOME}/.zshenv.d

if [ -d $fragments_dir ] ; then
  for file in $fragments_dir/.??*.zsh ; do
    [ -d $file ] && continue
    . $file
  done

  unset file
fi
