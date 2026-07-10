#!/bin/bash

set -euo pipefail

# Reduce window and system motion so tiling feels less syrupy.
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
defaults write NSGlobalDomain AppleReduceMotion -bool true
defaults write -g QLPanelAnimationDuration -float 0

# Make Spaces less "helpful" so window/workspace movement stays predictable.
defaults write com.apple.dock mru-spaces -bool false
defaults write com.apple.dock workspaces-auto-swoosh -bool false

# Speed up Dock and Mission Control transitions.
defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.dock autohide-delay -float 0

killall Dock >/dev/null 2>&1 || true

cat <<'EOF'
Applied AeroSpace-related macOS defaults.
Still manual in System Settings:
- Keyboard shortcuts: disable conflicts with AeroSpace bindings
- Privacy > Accessibility: allow AeroSpace
- Privacy > Input Monitoring: allow AeroSpace if prompted
- Trackpad gestures: disable Mission Control / Space-swipe gestures if they get in the way
EOF
