# linuxdots

Omarchy dotfiles managed with GNU Stow.

## Usage

```bash
git clone git@github.com:skordeanz/linuxdots.git ~/.dotfiles
cd ~/.dotfiles
./restow
```

## Packages

| Package | Purpose |
|---------|---------|
| hypr | Window manager |
| waybar | Status bar |
| bash | Shell |
| starship | Prompt |
| git | VCS config |
| ghostty | Terminal emulator |
| walker | Application launcher |
| nvim | Text editor |
| mpv | Media player |
| lazygit | Git TUI |
| fastfetch | System info |
| xdg | Default apps, user dirs |

## Commands

```bash
./restow       # re-stow all packages
./restow -n    # dry run
./restow --adopt  # overwrite stow tree with live configs
```
