#!/bin/bash

# install brew 
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";

brew install vim;
brew install zsh;

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";

brew install tmux;

# install jdk1.8
brew tap adoptopenjdk/openjdk;
brew install --cask adoptopenjdk8;
