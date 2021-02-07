# memo

ホームの設定ファイルを管理するアレ

どのように動作する

```text
下記ファイルが存在していたなら
dotfiles/home_rc/.hagerc

元ファイルへリンクするシンボリックリンクを ~/ へ作成する
~/.hagerc => dotfiles/home_rc/.hagerc

シンボリックリンクを作成しようとしているパスに既にファイルが存在していたなら、メッセージを表示する
```

どのように実行する

```sh
cd ~/
git clone git@github.com:mokoaki/dotfiles.git
cd dotfiles
deploy
```
