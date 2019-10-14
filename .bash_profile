eval "$(rbenv init -)"
eval "$(nodenv init -)"

if [ -d .bash_profile.d ]; then
  for file in .bash_profile.d/* ; do
    . $file
  done
  unset file
fi
