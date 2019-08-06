#!/bin/bash

if [ ! -e $HOME/.zshrc ]; then
  ln -s $CONFIGURATION_PATH/.zshrc $HOME/.zshrc
fi

if [ ! -e $HOME/.vimrc ]; then
  ln -s $CONFIGURATION_PATH/.vimrc $HOME/.vimrc
fi

if [ ! -e $HOME/.tmux.conf ]; then
  ln -s $CONFIGURATION_PATH/.tmux.conf $HOME/.tmux.conf
fi

