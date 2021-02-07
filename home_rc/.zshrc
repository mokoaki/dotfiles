eval "$(rbenv init - zsh)"
eval "$(nodenv init - zsh)"

fragments_dir=${HOME}/.zshrc.d
export PATH="/usr/local/sbin:$PATH"

if [ -d $fragments_dir ] ; then
  for file in $fragments_dir/.??*.zsh ; do
    [ -d $file ] && continue
    . $file
  done

  unset file
fi
