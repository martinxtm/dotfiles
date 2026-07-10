#!/bin/bash

set -euo pipefail

PYTHON_SERIES="${PYTHON_SERIES:-3.12}"
KERNEL_NAME="${KERNEL_NAME:-python312}"
KERNEL_DISPLAY_NAME="${KERNEL_DISPLAY_NAME:-Python (${PYTHON_SERIES})}"
VENV_DIR="${VENV_DIR:-.venv}"

if ! command -v pyenv >/dev/null 2>&1; then
  echo "pyenv is required. Install Brewfile dependencies first."
  exit 1
fi

if ! command -v uv >/dev/null 2>&1; then
  echo "uv is required. Install Brewfile dependencies first."
  exit 1
fi

PYTHON_VERSION="$(
  pyenv install --list \
    | rg "^[[:space:]]*${PYTHON_SERIES//./\\.}\\.[0-9]+$" \
    | sed 's/^[[:space:]]*//' \
    | tail -1
)"

if [ -z "$PYTHON_VERSION" ]; then
  echo "Could not find a pyenv install candidate for ${PYTHON_SERIES}.x"
  exit 1
fi

echo "Installing Python ${PYTHON_VERSION} via pyenv"
pyenv install -s "$PYTHON_VERSION"
pyenv global "$PYTHON_VERSION"
pyenv rehash

echo "Creating virtualenv in ${VENV_DIR}"
uv venv "$VENV_DIR" --python "$PYTHON_VERSION"

echo "Installing Jupyter kernel support"
"$VENV_DIR/bin/python" -m pip install --upgrade pip
uv pip install --python "$VENV_DIR/bin/python" ipykernel jupyterlab

echo "Registering ipykernel as ${KERNEL_NAME}"
"$VENV_DIR/bin/python" -m ipykernel install --user --name "$KERNEL_NAME" --display-name "$KERNEL_DISPLAY_NAME"

echo
echo "Done."
echo "Python version: $PYTHON_VERSION"
echo "Global pyenv version: $(pyenv global)"
echo "Virtualenv: $VENV_DIR"
echo "Kernel: $KERNEL_DISPLAY_NAME"
