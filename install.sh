#!/bin/bash

set -euo pipefail

if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

brew trust 1password/tap

brew bundle --file="$PWD/Brewfile"

./link-dotfiles.sh
./setup_codex.sh
./setup_macos.sh
./setup_aerospace.sh

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

brew services start borders
brew services start sketchybar
