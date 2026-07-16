#!/bin/bash

set -euo pipefail

link_file() {
  local source_path="$1"
  local target_path="$2"
  local backup_path

  if [ -L "$target_path" ]; then
    if [ "$(readlink "$target_path")" = "$source_path" ]; then
      return
    fi

    rm "$target_path"
  elif [ -e "$target_path" ]; then
    backup_path="${target_path}.backup"

    if [ -e "$backup_path" ] || [ -L "$backup_path" ]; then
      backup_path="${target_path}.backup.$(date +%Y%m%d%H%M%S)"
    fi

    mv "$target_path" "$backup_path"
  fi

  if [ -e "$target_path" ] || [ -L "$target_path" ]; then
    return
  fi

  mkdir -p "$(dirname "$target_path")"
  ln -s "$source_path" "$target_path"
}

link_file "$PWD/.zshenv_common" "$HOME/.zshenv"
link_file "$PWD/.zprofile" "$HOME/.zprofile"
link_file "$PWD/.zshrc" "$HOME/.zshrc"
link_file "$PWD/.gitconfig" "$HOME/.gitconfig"
link_file "$PWD/.vimrc" "$HOME/.vimrc"
link_file "$PWD/.tmux.conf" "$HOME/.tmux.conf"
link_file "$PWD/.aerospace.toml" "$HOME/.aerospace.toml"
link_file "$PWD/.config/borders" "$HOME/.config/borders"
link_file "$PWD/.config/karabiner" "$HOME/.config/karabiner"
link_file "$PWD/.config/sketchybar" "$HOME/.config/sketchybar"
link_file "$PWD/.ssh/config" "$HOME/.ssh/config"
link_file "$PWD/nvim" "$HOME/.config/nvim"

for skill_manifest in "$PWD"/*/SKILL.md; do
  if [ ! -e "$skill_manifest" ]; then
    continue
  fi

  skill_dir="$(dirname "$skill_manifest")"
  skill_name="$(basename "$skill_dir")"
  link_file "$skill_dir" "$HOME/.codex/skills/$skill_name"
done

if [ ! -e "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi
