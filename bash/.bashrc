eval "$(thefuck --alias)"

source ~/.config/bash/aliases

shopt -s extglob

source ~/.config/bash/execut/WorkFlowShortCuts.sh

source ~/.config/bash/execut/arithGame.sh

#figlet fuck the police

source ~/.git-completion.bash

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.

# export GEM_HOME=~/.gem
# export GEM_PATH=~/.gem

## rvm

export EDITOR="nvim"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
bind -x '"\C-p": nvim $(fzf);'

# export FZF_DEFAULT_COMMAND='rg --files --hidden --follow'
# export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

