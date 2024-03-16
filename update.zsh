# dotfiles=~/Documents/dotfiles

cp ~/.config/zsh/.zshrc ~/Documents/dotfiles/zsh/.zshrc
cp ~/.config/zsh/scripts/* ~/Documents/dotfiles/zsh/scripts/

cp ~/.config/bash/.bashrc ~/Documents/dotfiles/bash/.bashrc
# for i in $HOME/.config/bash/execute/*; do cp $i ./bash/execut; done
for i in ~/.config/bash/execut/*.sh; do cp $i ./bash/execut/; done


cp ~/.config/nvim/UltiSnips/tex.snippets ~/Documents/dotfiles/nvim/UltiSnips/tex.snippets
cp ~/.config/nvim/init.vim ~/Documents/dotfiles/nvim/init.vim
cp ~/.config/nvim/lua/lsp-wrapper.vim ~/Documents/dotfiles/nvim/lua/lsp-wrapper.vim

# cp ~/.local/share/nvim/site/ftplugin/* ~/Documents/dotfiles/nvim/ftplugin/

cp ~/.config/zathura/zathurarc ~/Documents/dotfiles/zathura/zathurarc

cp ~/.config/tmux/tmux.conf ~/Documents/dotfiles/tmux/tmux.conf

cp ~/.config/kitty/kitty.conf ~/Documents/dotfiles/kitty/kitty.conf

cp ~/.zshenv .zshenv

brew bundle dump --file=./Brewfile --force

for env in $(conda env list | awk '{print $1}' | tail -n +3); do
    conda env export -n $env > conda_envs/$env.yml;
done

# conda env export -n kaggle > conda_envs/kaggle.yml
