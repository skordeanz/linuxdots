# dotfiles

My Omarchy (Arch + Hyprland) configuration, managed with [GNU Stow](https://www.gnu.org/software/stow/).

Every top-level directory is a stow package that mirrors `$HOME`. Stowing a
package symlinks its contents into place, so the live config **is** the repo —
edit either one and they stay in sync, with no copy step to forget.

## Install on a new machine

```sh
git clone git@github.com:skordeanz/linuxdots.git ~/dotfiles
cd ~/dotfiles
./install.sh            # restow every package
./install.sh hypr nvim  # ...or just the ones you name
```

Remove a link again with `stow -t ~ -D <package>`; the real files stay safe in
the repo either way.

## Packages

| Package | Target(s) |
| --- | --- |
| `bash` | `~/.bashrc` — the actually-used shell (zsh is not installed; `zsh/` is a placeholder) |
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

## The hermarchy theme

`~/.config/omarchy/themes/hermarchy` is a git clone of
<https://github.com/archer-clawbot/omarchy-hermarchy-theme> (29M, mostly
wallpapers), so it is deliberately **not** vendored into this repo. Reinstall
it on a new machine with:

```sh
git clone https://github.com/archer-clawbot/omarchy-hermarchy-theme.git \
  ~/.config/omarchy/themes/hermarchy
omarchy-current-theme set hermarchy
```

Theme *behavior* that lives outside the clone (hooks, defaults, branding,
extensions, themed templates) **is** tracked under the `omarchy` package.

## Keeping it current

After changing a config, `cd ~/dotfiles && git commit`. After an Omarchy
update writes through a symlink into the repo, review the diff and commit the
upstream changes deliberately.
