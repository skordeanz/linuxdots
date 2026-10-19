# dotfiles

My Omarchy (Arch + Hyprland) configuration, managed with [GNU Stow](https://www.gnu.org/software/stow/).

Every top-level directory is a stow package that mirrors `$HOME`. Stowing a
package symlinks its contents into place, so the live config **is** the repo —
edit either one and they stay in sync, with no copy step to forget.

## Install on a new machine

```sh
git clone git@github.com:skordeanz/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh            # restow every package
./install.sh hypr nvim  # ...or just the ones you name
```

Remove a link again with `stow -t ~ -D <package>`; the real files stay safe in
the repo either way.

## Packages

| Package | Target(s) |
| --- | --- |
| `btop` | `~/.config/btop/` |
| `foot` | `~/.config/foot/` |
| `git` | `~/.config/git/` |
| `herdr` | `~/.config/herdr/` |
| `hypr` | `~/.config/hypr/` |
| `imv` | `~/.config/imv/` |
| `local` | `~/.local/bin/cleanup.sh` |
| `nvim` | `~/.config/nvim/` |
| `omarchy` | `~/.config/omarchy/{hooks,defaults,branding,extensions,themed,screen-time}/` |
| `starship` | `~/.config/starship.toml` |
| `tmux` | `~/.config/tmux/` |
| `uwsm` | `~/.config/uwsm/` |
| `voxtype` | `~/.config/voxtype/`, `~/.config/systemd/user/voxtype.service` |
| `xcompose` | `~/.XCompose` |
| `zsh` | `~/.zshrc` |

## What is deliberately *not* tracked

- **App data/profiles** — chromium, zen, vesktop, obsidian and friends are
  personal data, not configuration (and are gigabytes).
- **Secrets and tool state** — `~/.config/opencode` (`auth.json`), Hermes,
  Bitwarden, github-copilot, spicetify, `gh`, go/uv/mise installs.
- **Hardware/session specifics** — pipewire, pulse, wireplumber, dconf.
- **Omarchy-managed internals** — `~/.config/omarchy/plugins/` is reinstalled
  with `omarchy plugin add`; `shell.json` and `lock-explorer.json` are runtime
  state, not config.

Migration leftovers (tool `*.bak` / `*.lacquer-backup-*` files) sit in
`.attic/`, which is git-ignored.

## Keeping it current

After changing a config, `cd ~/dotfiles && git commit`. After an Omarchy
update writes through a symlink into the repo, review the diff and commit the
upstream changes deliberately.
