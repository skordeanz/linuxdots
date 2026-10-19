# dotfiles

My Omarchy (Arch + Hyprland) configs, managed with [GNU Stow](https://www.gnu.org/software/stow/).
Each top-level directory is a stow package mirroring `$HOME`, so the live config **is** the repo.

## Install

```sh
git clone https://github.com/skordeanz/linuxdots.git ~/dotfiles
cd ~/dotfiles
./install.sh            # all packages
./install.sh hypr nvim  # subset
```

## Packages

| Package | Target(s) |
| --- | --- |
| `bash` | `~/.bashrc` |
| `btop` | `~/.config/btop/btop.conf` |
| `foot` | `~/.config/foot/` |
| `git` | `~/.config/git/` |
| `herdr` | `~/.config/herdr/config.toml` |
| `hypr` | `~/.config/hypr/` |
| `imv` | `~/.config/imv/` |
| `local` | `~/.local/bin/cleanup.sh` |
| `nvim` | `~/.config/nvim/` |
| `omarchy` | `~/.config/omarchy/` — hooks, defaults, branding, extensions, themed templates |
| `starship` | `~/.config/starship.toml` |
| `tmux` | `~/.config/tmux/` |
| `uwsm` | `~/.config/uwsm/env.d/20-capture` |
| `voxtype` | `~/.config/voxtype/`, `~/.config/systemd/user/voxtype.service` |
| `xcompose` | `~/.XCompose` |

## Notes

- Not tracked, by design: app data and profiles (browsers, vesktop, obsidian), secrets
  and tool state (`opencode`, `gh`, `spicetify`…), hardware-specific settings
  (pipewire, wireplumber), and Omarchy-managed internals (`plugins/`, `shell.json`).
- The hermarchy theme is a clone of its upstream repo, not vendored here:

  ```sh
  git clone https://github.com/archer-clawbot/omarchy-hermarchy-theme.git \
    ~/.config/omarchy/themes/hermarchy
  ```
