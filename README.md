# linuxdots

> Personal Omarchy config — Arch Linux · Hyprland · [GNU Stow](https://www.gnu.org/software/stow/)

Each top-level directory is a stow package mirroring `$HOME`, so the live
config **is** the repo.

## Install

```sh
git clone https://github.com/skordeanz/linuxdots.git ~/.linuxdots
cd ~/.linuxdots
git submodule update --init --recursive   # plugins
stow -t ~ */                              # everything
```

<sub>On an empty <code>$HOME</code>, install a subset with <code>--no-folding</code> so stow doesn't turn <code>~/.config</code> itself into a symlink: <code>stow -t ~ --no-folding hypr nvim</code></sub>

## Packages

| Package | Target |
| :-- | :-- |
| `bash` | `~/.bashrc` |
| `bin` | `~/.local/bin/cleanup.sh` |
| `foot` | `~/.config/foot/` |
| `git` | `~/.config/git/` |
| `herdr` | `~/.config/herdr/config.toml` |
| `hypr` | `~/.config/hypr/` |
| `nvim` | `~/.config/nvim/` |
| `omarchy` | `~/.config/omarchy/` — hooks, defaults, branding, extensions, plugins |
| `starship` | `~/.config/starship.toml` |
| `tmux` | `~/.config/tmux/` |
| `uwsm` | `~/.config/uwsm/env.d/20-capture` |
| `voxtype` | `~/.config/voxtype/`, `~/.config/systemd/user/voxtype.service` |
| `xcompose` | `~/.XCompose` |
| `zed` | `~/.config/zed/` |
