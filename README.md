# dotfiles

```text
./home_rc/.hagerc
があるなら
~/.hagerc => ./home_rc/.hagerc
へリンクを貼る
冪等性があり、既存ファイルを勝手に改変したりしないように
作っているつもりではある
```

```sh
cd ~/
git clone git@github.com:mokoaki/.dotfiles.git
cd .dotfiles
./deploy.rb
```

## dev

```sh
ruby -v
gem -v
bundler -v
gem update --system
gem update bundler
bundle install --path .bundle/gems --jobs 4 --clean
```
