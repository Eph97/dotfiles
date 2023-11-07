# add ZDOTDIR=~/.config/zsh to zshenv
# to tell zsh where to look for .zshrc file
bindkey -v
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh
bindkey -s '^p' 'nvim "$(fzf)"\n'


source ~/.config/bash/aliases.sh
source ~/.config/zsh/WorkFlowShortCuts.sh
# source ~/.config/bash/execut/arithGame.sh
# source ~/.config/zsh/pdfviewer.sh

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


export PATH="$HOME/miniconda/bin:$PATH"
.  $HOME/miniconda3/etc/profile.d/conda.sh

export EDITOR="nvim"

# export PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
#     nvim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
#     -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
#     -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""
# export MANPAGER='nvim --appimage-extract-and-run -c "set ft=man"'

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


# Yank to the system clipboard
function vi-yank-xclip {
    zle vi-yank
   echo "$CUTBUFFER" | xclip -i
}

zle -N vi-yank-xclip
bindkey -M vicmd 'y' vi-yank-xclip


for f in ~/.scripts/*; do source $f;done

alias ll="ls -l"

alias sprofile="source ~/.profile"

export GO111MODULE=on

export PATH="$HOME/go/bin:$PATH"

export PATH="$HOME/custom/bin:$PATH"

alias vimdiff='nvim -d'


export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias venv="source `find . -name activate`"
