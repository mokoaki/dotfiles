# ログインシェルとしてzshが起動された場合に読み込まれるリスト
# /etc/zshenv
# ~/.zshenv
# /etc/zprofile
# ~/.zprofile
# /etc/zshrc
# ~/.zshrc
# /etc/zlogin
# ~/.zlogin

# 補完 compilation
autoload -U compinit; compinit

# history
HISTFILE=${HOME}/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt share_history         # 同時に起動したzshの間でヒストリを共有する
setopt hist_ignore_all_dups  # 重複するコマンド行は古い方を削除
setopt hist_ignore_dups      # 直前と同じコマンドラインはヒストリに追加しない
setopt inc_append_history    # 履歴を即時反映
setopt hist_no_store         # historyコマンドは履歴に登録しない
setopt hist_reduce_blanks    # 余分な空白は詰めて記録

# 途中までコマンドを入力してCTRL+pからの[CTRL+p || CTRL+n]
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
setopt hist_expand
#setopt auto_list

# エイリアス
alias b='git b'
alias c='git c'
alias d='git d'
alias g='git'
alias gits='git s'
alias l='git l'
alias lo='git lo'
alias s='git s'
alias show='git show'
alias wip='git w'

alias ll='gls -alivF --color=auto --group-directories-first'
alias cp='cp -aiv'
alias mv='mv -iv'
alias rm='grm -Iv'

LESS='-igSMRXF'

# プロンプト（カレントブランチ名とか）
# とりあえずbrew install zsh-git-prompt
source "/usr/local/opt/zsh-git-prompt/zshrc.sh"
# シングルクォートで書くこと
PROMPT='%B%m%~%b$(git_super_status) %# '
ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_SEPARATOR="|"
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[magenta]%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[red]%}%{● %G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]%}%{✖ %G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[blue]%}%{✚ %G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{↓ %G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{↑ %G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{… %G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}%{✔ %G%}"
