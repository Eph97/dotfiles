# dotfiles=~/Documents/dotfiles

# Check and copy .zshrc for zsh
if [ -f ~/.config/zsh/.zshrc ]; then
  cp ~/.config/zsh/.zshrc ~/Documents/dotfiles/zsh/.zshrc
fi

# Check and copy scripts for zsh
if [ -d ~/.config/zsh/scripts/ ]; then
  cp ~/.config/zsh/scripts/* ~/Documents/dotfiles/zsh/scripts/
fi

# Check and copy .bashrc for bash
if [ -f ~/.config/bash/.bashrc ]; then
  cp ~/.config/bash/.bashrc ~/Documents/dotfiles/bash/.bashrc
fi

# Check and copy execute scripts for bash
for i in ~/.config/bash/execut/*.sh; do
  if [ -f "$i" ]; then
    cp "$i" ./bash/execut/
  fi
done

# Check and copy tex.snippets for nvim
if [ -f ~/.config/nvim/UltiSnips/tex.snippets ]; then
  cp ~/.config/nvim/UltiSnips/tex.snippets ~/Documents/dotfiles/nvim/UltiSnips/tex.snippets
fi

# Check and copy init.vim for nvim
if [ -f ~/.config/nvim/init.vim ]; then
  cp ~/.config/nvim/init.vim ~/Documents/dotfiles/nvim/init.vim
fi

# Check and copy lsp-wrapper.vim for nvim
if [ -f ~/.config/nvim/lua/lsp-wrapper.vim ]; then
  cp ~/.config/nvim/lua/lsp-wrapper.vim ~/Documents/dotfiles/nvim/lua/lsp-wrapper.vim
fi

# Uncommented the line below. Replace it with a loop to check each file in the directory if needed.

# Check and copy zathurarc for zathura
if [ -f ~/.config/zathura/zathurarc ]; then
  cp ~/.config/zathura/zathurarc ~/Documents/dotfiles/zathura/zathurarc
fi

# Check and copy tmux.conf for tmux
if [ -f ~/.config/tmux/tmux.conf ]; then
  cp ~/.config/tmux/tmux.conf ~/Documents/dotfiles/tmux/tmux.conf
fi

# Check and copy kitty.conf for kitty
if [ -f ~/.config/kitty/kitty.conf ]; then
  cp ~/.config/kitty/kitty.conf ~/Documents/dotfiles/kitty/kitty.conf
fi

# Check and copy .zshenv to the current directory
if [ -f ~/.zshenv ]; then
  cp ~/.zshenv .zshenv
fi


brew bundle dump --file=./Brewfile --force

for env in $(conda env list | awk '{print $1}' | tail -n +3); do
    conda env export -n $env > conda_envs/$env.yml;
done

# conda env export -n kaggle > conda_envs/kaggle.yml
