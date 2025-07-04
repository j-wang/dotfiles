#!/bin/bash
# Assumes dotfiles is in $HOME/dotfiles to use absolute paths
# This is required because of how symbolic links work

# Antidote
git clone --depth=1 https://github.com/mattmc3/antidote.git $HOME/.antidote

# Bash dotfiles
ln -s $HOME/dotfiles/.aliases $HOME/.aliases
ln -s $HOME/dotfiles/.bash_profile $HOME/.bash_profile
ln -s $HOME/dotfiles/.bashrc $HOME/.bashrc
ln -s $HOME/dotfiles/.inputrc $HOME/.inputrc
ln -s $HOME/dotfiles/.profile $HOME/.profile

# Git dotfiles
ln -s $HOME/dotfiles/.git-completion.bash $HOME/.git-completion.bash
ln -s $HOME/dotfiles/.gitconfig $HOME/.gitconfig
ln -s $HOME/dotfiles/.gitignore $HOME/.gitignore
ln -s $HOME/dotfiles/.gitmodules $HOME/.gitmodules

# ag dotfiles
ln -s $HOME/dotfiles/.agignore $HOME/.agignore

# zsh dotfiles
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc

# config dotfiles
mkdir -p $HOME/.config/lsd
mkdir -p $HOME/.config/git
rm -rf "$HOME/.config/nvim"  # delete nvim if it already exists
rm -f "$HOME/.config/git/allowed_signers"  # delete allowed_signers if it already exists
ln -s $HOME/dotfiles/.config/lsd/config.yaml $HOME/.config/lsd/config.yaml
ln -s $HOME/dotfiles/.config/git/allowed_signers $HOME/.config/git/allowed_signers
ln -s $HOME/dotfiles/.config/nvim $HOME/.config/nvim

# tmux conf
ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf

# hammerspoon dotfiles
ln -s $HOME/dotfiles/.hammerspoon $HOME/.hammerspoon

# emacs dotfiles
ln -s $HOME/dotfiles/.spacemacs.d $HOME/.spacemacs.d

# vim dotfiles
ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc

# misc
ln -s $HOME/dotfiles/.eslintrc $HOME/.eslintrc
