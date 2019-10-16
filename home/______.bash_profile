eval "$(rbenv init -)"
eval "$(nodenv init -)"

script_directory=`pwd`
fragments_dir=${script_directory}/fragments/.bash_profile.d

if [ -d $fragments_dir ] ; then
  for file in $fragments_dir/.??*.sh ; do
    [ -d $file ] && continue
    . $file
  done
  unset file
fi
