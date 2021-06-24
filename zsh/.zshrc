[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

bindkey -s '^p' 'nvim $(fzf)\n'

bindkey -v

source ~/.config/bash/aliases.sh

setopt extended_glob

# completion package
autoload -Uz compinit && compinit
# case insensitive path-completion 
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 

# PROMPT='%~ %# '
# PROMPT='%B%F{240}%1~%f%b %# '
PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%2~%f%b %# '

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{240}(%b)%r%f'
zstyle ':vcs_info:*' enable git
