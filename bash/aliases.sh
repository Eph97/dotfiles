alias aliases="nvim ~/.config/bash/aliases.sh"

alias sp="spotify"

alias nvimconf="nvim ~/.config/nvim/init.vim"
alias bashrc="nvim ~/.config/bash/.bashrc"
alias sbashrc="source ~/.config/bash/.bashrc"

alias szshrc="source ~/.config/zsh/.zshrc"
alias zshrc="nvim ~/.config/zsh/.zshrc"

alias yabairc="nvim ~/.config/yabai/yabairc"
alias skhdrc="nvim ~/.config/skhd/skhdrc"

alias .config="cd ~/.config"

CEMDir="~/Dropbox/CEM"
alias CEM="cd $CEMDir"

fabianDir="/Users/ephraimsutherland/documents/Fabian"
alias fabian="cd $fabianDir"

planetDir="/Users/ephraimsutherland/documents/Fabian/CEM/ephraim/planet"
alias planet="cd $planetDir"

alias ozone="cd /Users/ephraimsutherland/documents/ozone"
# alias python="python3"
# alias pip="pip3"

alias gits="git status"
alias gita="git add"

alias books="cd ~/Documents/Textbooks:pdfs/"

# p () {
#     local open
#     open=open   # on OSX, "open" opens a pdf in preview
#     ag -U -g ".pdf$" \
#     | fast-p \
#     | fzf --read0 --reverse -e -d $'\t'  \
#         --preview-window down:80% --preview '
#             v=$(echo {q} | gtr " " "|"); 
#             echo -e {1}"\n"{2} | ggrep -E "^|$v" -i --color=always;
#         ' \
#     | gcut -z -f 1 -d $'\t' | gtr -d '\n' | gxargs -r --null $open > /dev/null 2> /dev/null
# }

