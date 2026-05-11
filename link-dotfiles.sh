#!/bin/bash

# u may have to delete .zshenv
if [ ! -e "$HOME/.zshenv" ]; then
  ln -s "$PWD/.zshenv_common" "$HOME/.zshenv"
fi

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

if [ ! -e $HOME/.aerospace.toml ]; then
  ln -s $PWD/.aerospace.toml $HOME/.aerospace.toml
fi

if [ ! -e ~/.tmux/plugins/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

