#!/bin/bash

set -euo pipefail

# Trackpad: tap to click and two-finger secondary click.
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults write NSGlobalDomain ContextMenuGesture -int 1

# Dock: stay out of the way and stop advertising clutter.
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock orientation -string left
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock persistent-apps -array
defaults write com.apple.dock persistent-others -array

killall Dock >/dev/null 2>&1 || true

cat <<'EOF'
Applied general macOS defaults.
Still manual in System Settings:
- Trackpad changes may need a logout/login if macOS gets stubborn
EOF
