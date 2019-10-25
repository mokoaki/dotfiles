# とりあえずbrew install zsh-git-promptを使用している
source "/usr/local/opt/zsh-git-prompt/zshrc.sh"

# シングルクォートで書くこと
PROMPT='
%d $(git_super_status) %n@%m %D %*
$ '

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_SEPARATOR=" "
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[magenta]%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[red]%}%{● %G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]%}%{✖ %G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[blue]%}%{✚ %G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{↓ %G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{↑ %G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{… %G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}%{✔ %G%}"
