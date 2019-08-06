#!/bin/bash

if [ ! -e $HOME/.zshrc ]; then
  ln -s $CONFIGURATION_PATH/.zshrc $HOME/.zshrc
fi

if [ ! -e $HOME/.vimrc ]; then
  ln -s $CONFIGURATION_PATH/.vimrc $HOME/.vimrc
fi
