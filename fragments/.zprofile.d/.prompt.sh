autoload -Uz vcs_info
setopt prompt_subst

# vcsの表示
# zstyle ':vcs_info:*' enable git svn hg bzr
# zstyle ':vcs_info:*' check-for-changes true
# zstyle ':vcs_info:*' stagedstr "+"
# zstyle ':vcs_info:*' unstagedstr "*"
# zstyle ':vcs_info:*' formats '(%b%c%u)'
# zstyle ':vcs_info:*' actionformats '(%b(%a)%c%u)'

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "+"
zstyle ':vcs_info:git:*' unstagedstr ".."
zstyle ':vcs_info:*' formats "(%b %c%u)"
zstyle ':vcs_info:*' actionformats '[%b|%a]'

# PROMPT="%{${fg[blue]}%}[%~]%{${reset_color}%}"
# PROMPT=$PROMPT'${vcs_info_msg_0_}'
precmd () { vcs_info }
PROMPT='
%d $vcs_info_msg_0_ %n@%m %D %*
%# '

# # プロンプト表示直前にvcs_info呼び出し
# precmd () {
#     psvar=()
#     LANG=en_US.UTF-8 vcs_info
#     [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
# }
# # # とりあえずbrew install zsh-git-promptを使用
# # source "/usr/local/opt/zsh-git-prompt/zshrc.sh"

# # # シングルクォートで書くこと
# PROMPT='
# %d $(git_super_status) %n@%m %D %*
# %# '

# # ZSH_THEME_GIT_PROMPT_PREFIX="("
# ZSH_THEME_GIT_PROMPT_SUFFIX=")"
# ZSH_THEME_GIT_PROMPT_SEPARATOR=" "
# ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[magenta]%}"
# ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[red]%}%{o%G%}"
# ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]%}%{x%G%}"
# ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[blue]%}%{+%G%}"
# ZSH_THEME_GIT_PROMPT_BEHIND="%{↓ %G%}"
# ZSH_THEME_GIT_PROMPT_AHEAD="%{↑ %G%}"
# ZSH_THEME_GIT_PROMPT_UNTRACKED="%{..%G%}"
# ZSH_THEME_GIT_PROMPT_CLEAN="%{✔ %G%}"
