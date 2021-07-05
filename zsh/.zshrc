# add ZDOTDIR=~/.config/zsh to zshenv
# to tell zsh where to look for .zshrc file
bindkey -v
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
bindkey -s '^p' 'nvim $(fzf)\n'


source ~/.config/bash/aliases.sh
source ~/.config/bash/execut/WorkFlowShortCuts.sh

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


# export PATH="/Users/ephraimsutherland/miniconda/bin:$PATH"
.  /Users/ephraimsutherland/opt/miniconda3/etc/profile.d/conda.sh

export EDITOR="nvim"

export PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
    nvim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
    -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
    -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

