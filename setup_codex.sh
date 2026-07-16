#!/bin/bash

set -euo pipefail

CODEX_DIR="${HOME}/.codex"
CONFIG_PATH="${CODEX_DIR}/config.toml"
OBSIDIAN_VAULT="${HOME}/Documents/Obsidian/Martini"
CODEX_PROJECTS_ROOT="${HOME}/Documents/Codex"

mkdir -p "$CODEX_DIR"

cat >"$CONFIG_PATH" <<EOF
[projects."$CODEX_PROJECTS_ROOT"]
trust_level = "trusted"
network_access = true
writable_roots = ["$OBSIDIAN_VAULT"]

[mcp_servers.atlassian-rovo]
url = "https://mcp.atlassian.com/v1/mcp"

[tui.model_availability_nux]
"gpt-5.6-sol" = 1
EOF
