#!/bin/bash

# u may have to delete .zshrc 
if [ ! -e $HOME/.zshrc ]; then
  ln -s $PWD/.zshrc $HOME/.zshrc
fi

if [ ! -e $HOME/.vimrc ]; then
  ln -s $PWD/.vimrc $HOME/.vimrc
fi

if [ ! -e $HOME/.tmux.conf ]; then
  ln -s $PWD/.tmux.conf $HOME/.tmux.conf
fi

if [ ! -e ~/.vim/bundle/Vundle.vim ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

if [ ! -e ~/.tmux/plugins/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

