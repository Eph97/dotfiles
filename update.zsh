# dotfiles=~/Documents/dotfiles

cp ~/.config/zsh/.zshrc ~/Documents/dotfiles/zsh/.zshrc
cp ~/.config/zsh/scripts/arithGame.sh ~/Documents/dotfiles/zsh/scripts/arithGame.sh

cp ~/.config/bash/.bashrc ~/Documents/dotfiles/bash/.bashrc
# for i in $HOME/.config/bash/execute/*; do cp $i ./bash/execut; done
for i in ~/.config/bash/execut/*.sh; do cp $i ./bash/execut/; done

skels=`ls -a $HOME/.config/nvim/snippets/.skeleton.*`
for i in $skels; do cp $i ./nvim/snippets/; done
cp ~/.config/nvim/snippets/.math.preamble.tex ./nvim/snippets/.math.preamble.tex

cp ~/.config/nvim/UltiSnips/tex.snippets ~/Documents/dotfiles/nvim/UltiSnips/tex.snippets
cp ~/.config/nvim/init.vim ~/Documents/dotfiles/nvim/init.vim
cp ~/.config/nvim/lua/lsp-wrapper.vim ~/Documents/dotfiles/nvim/lua/lsp-wrapper.vim

cp ~/.local/share/nvim/site/ftplugin/* ~/Documents/dotfiles/nvim/ftplugin/

cp ~/.config/zathura/zathurarc ~/Documents/dotfiles/zathura/zathurarc

cp ~/.config/tmux/tmux.conf ~/Documents/dotfiles/tmux/tmux.conf

cp ~/.config/kitty/kitty.conf ~/Documents/dotfiles/kitty/kitty.conf

cp ~/.config/i3/config ~/Documents/dotfiles/i3/config
cp ~/.config/i3/compton.conf ~/Documents/dotfiles/i3/compton.conf
cp ~/.config/i3/rofi ~/Documents/dotfiles/i3/rofi
cp ~/.config/i3/i3blocks.conf ~/Documents/dotfiles/i3/i3blocks.conf

cp ~/.scripts/dmonitor ~/Documents/dotfiles/scripts/dmonitor
cp ~/.scripts/connect_bluetooth.sh ~/Documents/dotfiles/scripts/connect_bluetooth.sh


# loop through anonymous files in ~/.config/nvim/snippets/ and copy them to ./nvim/snippets
#


cp ~/.ssh/config ./ssh/
