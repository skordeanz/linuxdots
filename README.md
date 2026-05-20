# linuxdots

Omarchy dotfiles managed with GNU Stow.

## Usage

```bash
git clone git@github.com:skordeanz/linuxdots.git ~/.dotfiles
cd ~/.dotfiles
./restow
```

## Packages

| Package | Purpose | Config |
|---------|---------|--------|
| hypr | Window manager | [hypr/](hypr/.config/hypr/) |
| waybar | Status bar | [waybar/](waybar/.config/waybar/) |
| bash | Shell | [bash/](bash/) |
| starship | Prompt | [starship/](starship/.config/) |
| git | VCS config | [git/](git/.config/git/) |
| ghostty | Terminal emulator | [ghostty/](ghostty/.config/ghostty/) |
| walker | Application launcher | [walker/](walker/.config/walker/) |
| nvim | Text editor | [nvim/](nvim/.config/nvim/) |
| mpv | Media player | [mpv/](mpv/.config/mpv/) |
| lazygit | Git TUI | [lazygit/](lazygit/.config/lazygit/) |
| fastfetch | System info | [fastfetch/](fastfetch/.config/fastfetch/) |
| xdg | Default apps, user dirs | [xdg/](xdg/.config/) |

## Commands

```bash
./restow       # re-stow all packages
./restow -n    # dry run
./restow --adopt  # overwrite stow tree with live configs
```
