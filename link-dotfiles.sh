#!/bin/bash

set -euo pipefail

link_file() {
  local source_path="$1"
  local target_path="$2"

  if [ -e "$target_path" ] || [ -L "$target_path" ]; then
    return
  fi

  mkdir -p "$(dirname "$target_path")"
  ln -s "$source_path" "$target_path"
}

link_file "$PWD/.zshenv_common" "$HOME/.zshenv"
link_file "$PWD/.zprofile" "$HOME/.zprofile"
link_file "$PWD/.zshrc" "$HOME/.zshrc"
link_file "$PWD/.vimrc" "$HOME/.vimrc"
link_file "$PWD/.tmux.conf" "$HOME/.tmux.conf"
link_file "$PWD/.aerospace.toml" "$HOME/.aerospace.toml"
link_file "$PWD/.config/borders" "$HOME/.config/borders"
link_file "$PWD/.config/sketchybar" "$HOME/.config/sketchybar"
link_file "$PWD/.ssh/config" "$HOME/.ssh/config"
link_file "$PWD/AGENTS.md" "$HOME/.codex/AGENTS.md"
link_file "$PWD/.codex/config.toml" "$HOME/.codex/config.toml"
link_file "$PWD/jira-operations" "$HOME/.codex/skills/jira-operations"
link_file "$PWD/nvim" "$HOME/.config/nvim"

if [ ! -e "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi
