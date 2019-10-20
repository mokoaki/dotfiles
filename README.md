# dotfiles

- 冪等性があり、既存ファイルを勝手に改変したりはしない
  - ように作るべきであり、そう作られていることを確認すべき

どのように動作する

```text
下記ファイルが存在していたなら
dotfiles/home_rc/.hagerc

元ファイルへリンクするシンボリックリンクを~/へ作成する
~/.hagerc -> dotfiles/home_rc/.zshrc

シンボリックリンクのパスに既にファイルが存在していたなら

  元ファイルへリンクするシンボリックリンクであれば
    今から作成しようとしていたシンボリックリンクが既に存在していたという事
    何もしない

  その他の場合
    メッセージを表示
    何もしない
```

どのように実行する

```sh
cd ~/
git clone git@github.com:mokoaki/dotfiles.git
cd dotfiles
./deploy.rb
```

## dev

```sh
cd dotfiles
cat .ruby-version
ruby -v
gem -v
bundler -v
gem update --system
gem update bundler
bundle install --path=.bundle/gems --jobs=4 --clean
```
