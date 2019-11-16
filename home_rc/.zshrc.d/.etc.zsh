# 補完 compilation
autoload -Uz compinit && compinit -u
zstyle ':completion:*' menu select interactive
setopt menu_complete

# http://oomatomo.hatenablog.com/entry/36401841
# setopt auto_menu            # タブで補完候補を表示する
# setopt auto_cd              # ディレクトリ名のみ入力時、cdを適応させる
# setopt auto_list            # 補完候補が複数ある時に、一覧表示
# setopt auto_pushd           # cd実行時、ディレクトリスタックにpushされる
# setopt auto_param_keys      # カッコの対応などを自動的に補完
# setopt auto_param_slash     # ディレクトリ名の補完で末尾に/を自動的に付加
# setopt correct              # コマンドのスペルを訂正する
# setopt equals               # =commandを`which command`と同じ処理
# setopt globdots             # ドットの指定なしでドットファイルも候補に入る
# setopt interactive_comments # コマンドラインでの#以降をコメントと見なす
# setopt list_types           # 候補にファイルの種別を表示(ls -F)
# setopt list_packed          # 補完結果をできるだけ詰める
# setopt no_beep              # ビープ音を鳴らさない
# setopt nolistbeep           # 補完候補表示時にビープ音を鳴らさない
# setopt no_tify              # バックグランドジョブが終了時知らせてくれる
# setopt magic_equal_subst    # 引数での=以降も補完(--prefix=/usrなど)
# setopt mark_dirs            # ファイル名の展開でディレクトリにマッチした場合末尾に / を付加する
setopt prompt_subst         # プロンプト定義内で変数置換やコマンド置換を扱う
# setopt print_exit_value     # 戻り値が 0 以外の場合終了コードを表示
# setopt pushd_ignore_dups    # ディレクトリスタックに重複する物は古い方を削除

# ディレクトリ名を入力するだけで移動
setopt auto_cd

# 移動したディレクトリを記録しておく。"cd [Tab]"で移動履歴を一覧
setopt auto_pushd

# コマンド訂正を依頼
setopt correct
