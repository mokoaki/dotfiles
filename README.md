# dotfiles

```text
./dotfiles/home_rc/.hagerc
があるなら
~/.hagerc => ./dotfiles/home_rc/.hagerc
へシンボリックリンクを貼る
冪等性があり、既存ファイルを勝手に改変したりはしない
```

```sh
cd ~/
git clone git@github.com:mokoaki/dotfiles.git
cd dotfiles
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
