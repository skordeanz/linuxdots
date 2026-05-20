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
| hypr | Window manager — [config](hypr/.config/hypr/) |
| waybar | Status bar — [config](waybar/.config/waybar/) |
| bash | Shell — [config](bash/) |
| starship | Prompt — [config](starship/.config/) |
| git | VCS — [config](git/.config/git/) |
| ghostty | Terminal — [config](ghostty/.config/ghostty/) |
| walker | Launcher — [config](walker/.config/walker/) |
| nvim | Editor — [config](nvim/.config/nvim/) |
| mpv | Media player — [config](mpv/.config/mpv/) |
| lazygit | Git TUI — [config](lazygit/.config/lazygit/) |
| fastfetch | System info — [config](fastfetch/.config/fastfetch/) |
| xdg | Default apps, dirs — [config](xdg/.config/) |

## Commands

```bash
./restow       # re-stow all packages
./restow -n    # dry run
./restow --adopt  # overwrite stow tree with live configs
```
