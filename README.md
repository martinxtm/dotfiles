# dotfiles

Fresh Mac:

```sh
git clone <repo> ~/dotfiles
cd ~/dotfiles
./install.sh
```

Re-running `./install.sh` is fine. Existing real files/directories are moved to `*.backup` before symlinks are created.

Then:

```sh
# either generate a fresh key or use a migrated one
ssh-keygen -t ed25519 -C "you@example.com"
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
gh auth login
gh ssh-key add ~/.ssh/id_ed25519.pub --title "$(scutil --get ComputerName)"
ssh -T git@github.com
```

If you use a migrated key instead, replace `id_ed25519` above with that filename.

Pi access:

Before replacing the old Mac, add the future key to the Pis while access still works.

```sh
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519_newmac -C "new-mac"
cat ~/.ssh/id_ed25519_newmac.pub | ssh pi 'mkdir -p ~/.ssh && chmod 700 ~/.ssh && cat >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys'
cat ~/.ssh/id_ed25519_newmac.pub | ssh fischfresse 'mkdir -p ~/.ssh && chmod 700 ~/.ssh && cat >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys'
```

Then move `~/.ssh/id_ed25519_newmac` and `~/.ssh/id_ed25519_newmac.pub` to the new Mac securely and add the key there:

```sh
ssh-add --apple-use-keychain ~/.ssh/id_ed25519_newmac
```

Python:

```sh
./setup_python.sh
```

Still manual:
- open Firefox once, then log into Dashlane
- sign into 1Password
- sign into Codex / ChatGPT if needed
- review keyboard shortcuts for conflicts with AeroSpace bindings
- grant AeroSpace permissions
- open Karabiner-Elements once so it picks up `~/.config/karabiner/karabiner.json`
- grant SketchyBar / Borders permissions if prompted
- optionally disable trackpad Mission Control / Space-swipe gestures if they get in the way
- log out and back in if tap-to-click / right-click trackpad settings do not apply immediately
- optionally import iTerm2 preferences
