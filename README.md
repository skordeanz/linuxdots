# linuxdots

My Omarchy (Arch + Hyprland) configs, managed with [GNU Stow](https://www.gnu.org/software/stow/).
Each top-level directory is a stow package mirroring `$HOME`, so the live config **is** the repo.

## Install

```sh
git clone https://github.com/skordeanz/linuxdots.git ~/.linuxdots
cd ~/.linuxdots
git submodule update --init --recursive   # plugins and themes
stow -t ~ */                              # all packages
```

On an empty `$HOME`, a subset install needs `--no-folding`, otherwise stow may
link `~/.config` itself:

```sh
stow -t ~ --no-folding hypr nvim
```

## Packages

| Package | Target(s) |
| --- | --- |
| `bash` | `~/.bashrc` |
| `foot` | `~/.config/foot/` |
| `git` | `~/.config/git/` |
| `herdr` | `~/.config/herdr/config.toml` |
| `hypr` | `~/.config/hypr/` |
| `bin` | `~/.local/bin/cleanup.sh` |
| `nvim` | `~/.config/nvim/` |
| `omarchy` | `~/.config/omarchy/` — hooks, defaults, branding, extensions, plugins, themes |
| `starship` | `~/.config/starship.toml` |
| `tmux` | `~/.config/tmux/` |
| `uwsm` | `~/.config/uwsm/env.d/20-capture` |
| `voxtype` | `~/.config/voxtype/`, `~/.config/systemd/user/voxtype.service` |
| `xcompose` | `~/.XCompose` |
| `zed` | `~/.config/zed/settings.json`, `keymap.json`, `themes/` |
