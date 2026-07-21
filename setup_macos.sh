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

# Menu bar: let SketchyBar own the top edge instead of stacking under Apple chrome.
defaults write NSGlobalDomain _HIHideMenuBar -bool true
defaults write com.apple.controlcenter "NSStatusItem Visible Bluetooth" -bool true
defaults write com.apple.Siri StatusMenuVisible -bool false
defaults write com.apple.Siri UserHasDeclinedEnable -bool true
defaults -currentHost write com.apple.Spotlight MenuItemHidden -int 1

# Input sources: keep German default, but make US International PC available for English/French.
defaults write com.apple.HIToolbox AppleEnabledInputSources -array \
  '{ InputSourceKind = "Keyboard Layout"; "KeyboardLayout ID" = 3; "KeyboardLayout Name" = "German"; }' \
  '{ InputSourceKind = "Keyboard Layout"; "KeyboardLayout ID" = 15000; "KeyboardLayout Name" = "USInternational-PC"; }'
defaults write com.apple.HIToolbox AppleInputSourceHistory -array \
  '{ InputSourceKind = "Keyboard Layout"; "KeyboardLayout ID" = 3; "KeyboardLayout Name" = "German"; }' \
  '{ InputSourceKind = "Keyboard Layout"; "KeyboardLayout ID" = 15000; "KeyboardLayout Name" = "USInternational-PC"; }'
defaults write com.apple.HIToolbox AppleSelectedInputSources -array \
  '{ InputSourceKind = "Keyboard Layout"; "KeyboardLayout ID" = 3; "KeyboardLayout Name" = "German"; }'
defaults write com.apple.HIToolbox AppleDefaultAsciiInputSource -dict \
  InputSourceKind "Keyboard Layout" \
  "KeyboardLayout ID" 15000 \
  "KeyboardLayout Name" "USInternational-PC"

killall Dock >/dev/null 2>&1 || true
killall SystemUIServer >/dev/null 2>&1 || true

cat <<'EOF'
Applied general macOS defaults.
Still manual in System Settings:
- Trackpad and input-source changes may need a logout/login if macOS gets stubborn
EOF
