### vim:ft=zsh

NAME=${HOSTNAME:-$HOST}

## use antigen
[ -f ${HOME}/.zsh.d/antigen/antigen.zsh ] && source ${HOME}/.zsh.d/.zshrc.antigen

## ##### ##### ##### ##### #####
## directory setting
setopt auto_cd
setopt auto_pushd
cdpath=(${HOME})
chpwd_functions=($chpwd_functions dirs)
setopt no_flow_control

## ##### ##### ##### ##### #####
## Command history configuration
HISTFILE=${HOME}/.zsh_history.${NAME}
HISTSIZE=100000
SAVEHIST=$HISTSIZE
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data
setopt inc_append_history

# don't follow command and directory
DISABLE_AUTO_TITLE=true

## ##### ##### ##### ##### #####
## abbrev
setopt magic_equal_subst
setopt extended_glob
setopt mark_dirs

## ##### ##### ##### ##### #####
## jobs
setopt long_list_jobs

## ##### ##### ##### ##### #####
## Keybind configuration
#
bindkey -v

# historical backward/forward search with linehead string binded to ^P/^N
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

# reverse menu completion binded to Shift-Tab
bindkey "\e[Z" reverse-menu-complete

## zsh editor
autoload zed

## Prediction configuration

## Alias configuration
setopt complete_aliases     # aliased ls needs if file/dir completions work

## ##### ##### ##### ##### #####
## External Setting
[ -f ${HOME}/.aliases ] && source ${HOME}/.aliases
[ -f ${HOME}/.zsh.d/.zshrc.misc ] && source ${HOME}/.zsh.d/.zshrc.misc
[ -f ${HOME}/.zsh.d/.zshrc.local.${NAME} ] && source ${HOME}/.zsh.d/.zshrc.local.${NAME}

## plugins
[ -f ${HOME}/.autojump/etc/profile.d/autojump.sh ] && source ${HOME}/.autojump/etc/profile.d/autojump.sh

