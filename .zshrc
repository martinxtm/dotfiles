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

# pyenv (interactive init only)
if command -v pyenv >/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# jenv init (interactive only)
if command -v jenv >/dev/null 2>&1; then
  eval "$(jenv init -)"
fi

# rvm (load as function for interactive sessions)
if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
  # Load RVM into a shell session *as a function*
  source "$HOME/.rvm/scripts/rvm"
fi

# Prompt
export PS1="%~ $ "

# Aliases
alias py='python'
alias vi='nvim'
alias vin='nvim'

# AWS SSO helpers (interactive completions)
export AWS_PROFILE=nw-enrichment-ml-prod:NW-Administrator
__aws_sso_profile_complete() {
  local _args=${AWS_SSO_HELPER_ARGS:- -L error}
  _multi_parts : "($(/opt/homebrew/bin/aws-sso ${=_args} list --csv Profile))"
}
aws-sso-profile() {
  local _args=${AWS_SSO_HELPER_ARGS:- -L error}
  if [ -n "$AWS_PROFILE" ]; then
    echo "Unable to assume a role while AWS_PROFILE is set"
    return 1
  fi
  eval $(/opt/homebrew/bin/aws-sso ${=_args} eval -p "$1")
  if [ "$AWS_SSO_PROFILE" != "$1" ]; then
    return 1
  fi
}
aws-sso-clear() {
  local _args=${AWS_SSO_HELPER_ARGS:- -L error}
  if [ -z "$AWS_SSO_PROFILE" ]; then
    echo "AWS_SSO_PROFILE is not set"
    return 1
  fi
  eval $(/opt/homebrew/bin/aws-sso ${=_args} eval -c)
}
if command -v compdef >/dev/null 2>&1; then
  compdef __aws_sso_profile_complete aws-sso-profile
fi
if command -v complete >/dev/null 2>&1; then
  complete -C /opt/homebrew/bin/aws-sso aws-sso
fi

# Optional: load local plugin file if present
[ -f "$HOME/.config/op/plugins.sh" ] && source "$HOME/.config/op/plugins.sh"

