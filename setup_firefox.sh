#!/bin/bash

set -euo pipefail

FIREFOX_APP="/Applications/Firefox.app"
FIREFOX_POLICIES_DIR="${FIREFOX_APP}/Contents/Resources/distribution"
SOURCE_POLICIES="$PWD/firefox/policies.json"

if [ ! -d "$FIREFOX_APP" ]; then
  echo "Firefox.app is not installed yet. Skipping Firefox setup."
  exit 0
fi

mkdir -p "$FIREFOX_POLICIES_DIR"
cp "$SOURCE_POLICIES" "${FIREFOX_POLICIES_DIR}/policies.json"

if command -v defaultbrowser >/dev/null 2>&1; then
  defaultbrowser firefox
fi

cat <<'EOF'
Applied Firefox setup.
- Firefox set as default browser
- Firefox policies installed for force-managed extensions
- Open Firefox once, then log into Dashlane
EOF
