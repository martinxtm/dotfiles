# ~/.zshrc
# Load common env (safe for both interactive and non-interactive)
[ -f "$HOME/.zshenv_common" ] && source "$HOME/.zshenv_common"

# If shell is non-interactive, stop here to keep startup fast.
# (Interactive shells continue below.)
case "$-" in
  *i*) ;;  # interactive: continue
  *) return 0 ;;
esac

# -------------------------
# Interactive-only settings
# -------------------------

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git tmux vi-mode)
[ -f "$ZSH/oh-my-zsh.sh" ] && source "$ZSH/oh-my-zsh.sh"

# Homebrew shellenv (if installed)
if [ -x "/opt/homebrew/bin/brew" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# jenv init (interactive only)
if command -v jenv >/dev/null 2>&1; then
  eval "$(jenv init -)"
fi

# Prompt
# export PS1="%~ $ "

# Aliases
alias py='python'
alias vi='nvim'
alias vin='nvim'

# Optional: load local plugin file if present
[ -f "$HOME/.config/op/plugins.sh" ] && source "$HOME/.config/op/plugins.sh"

if [ -f /opt/homebrew/opt/fzf/shell/completion.zsh ]; then
  source /opt/homebrew/opt/fzf/shell/completion.zsh
fi
if [ -f /opt/homebrew/opt/fzf/shell/key-bindings.zsh ]; then
  source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
fi
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"
