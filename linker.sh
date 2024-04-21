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
ln -s $HOME/dotfiles/.config/lsd $HOME/.config/lsd

# todo.sh dotfiles
# ln -s $HOME/dotfiles/todo.cfg $HOME/todo.cfg
# taskwarrior dotfile
# ln -s $HOME/dotfiles/.taskrc $HOME/taskrc

# hammerspoon dotfiles
ln -s $HOME/dotfiles/.hammerspoon $HOME/.hammerspoon

# emacs dotfiles
ln -s $HOME/dotfiles/.spacemacs.d $HOME/.spacemacs.d

# vim dotfiles
ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc

# misc
ln -s $HOME/dotfiles/.eslintrc $HOME/.eslintrc
