# add ZDOTDIR=~/.config/zsh to zshenv
# to tell zsh where to look for .zshrc file
# eval "$(/opt/homebrew/bin/brew shellenv)"
#
SAVEHIST=1000  # Save most-recent 1000 lines
HISTFILE=~/.zsh_history

if [ -f "/opt/homebrew/Cellar/fzf/0.45.0/shell/key-bindings.zsh" ]; then
	. /opt/homebrew/Cellar/fzf/0.45.0/shell/key-bindings.zsh 
fi


bindkey -v
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
bindkey -s '^p' 'nvim $(fzf)\n'


source ~/.config/zsh/aliases.sh
source ~/.config/zsh/scripts/WorkFlowShortCuts.sh
# source ~/.config/zsh/scripts/arithGame.sh

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
# .  /Users/ephraimsutherland/opt/miniconda3/etc/profile.d/conda.sh

export EDITOR="nvim"

export PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
    nvim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
    -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
    -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

# vim mode config {{{
# ---------------

# Activate vim mode.
bindkey -v

# Remove mode switching delay.
KEYTIMEOUT=5

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'

  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

# Use beam shape cursor on startup.
echo -ne '\e[5 q'

# Use beam shape cursor for each new prompt.
preexec() {
   echo -ne '\e[5 q'
}

bindkey -v '^?' backward-delete-char
# }}}
#
# export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
# export PATH="$PATH:$GEM_HOME/bin"
# eval "$(rbenv init -)"
# export PATH=$PATH:/Applications/Stata/StataSE.app/Contents/MacOS
#
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin


# figlet fuck the police
#
export PATH="/Users/ephraimsutherland/.local/bin:$PATH"

# alias venv="source `find . -name activate`"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/ephraimsutherland/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/ephraimsutherland/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/ephraimsutherland/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/ephraimsutherland/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/Users/ephraimsutherland/miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/Users/ephraimsutherland/miniforge3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<


export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

