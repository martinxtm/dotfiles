export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv >/dev/null 2>&1; then
  # pyenv selects the default Python version; uv handles envs and packages.
  eval "$(pyenv init --path)"
fi
