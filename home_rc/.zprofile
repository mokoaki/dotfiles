fragments_dir=${HOME}/.zprofile.d

if [ -d $fragments_dir ] ; then
  for file in $fragments_dir/.??*.zsh ; do
    [ -d $file ] && continue
    . $file
  done

  unset file
fi
