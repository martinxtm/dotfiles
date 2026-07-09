# dotfiles

Fresh Mac:

```sh
git clone <repo> ~/dotfiles
cd ~/dotfiles
./install.sh
```

Then:

```sh
ssh-keygen -t ed25519 -C "you@example.com"
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
gh auth login
gh ssh-key add ~/.ssh/id_ed25519.pub --title "$(scutil --get ComputerName)"
ssh -T git@github.com
```

Python:

```sh
pyenv install 3.12
pyenv global 3.12
uv venv
```

Still manual:
- sign into 1Password
- grant AeroSpace permissions
- grant SketchyBar / Borders permissions if prompted
- optionally import iTerm2 preferences
