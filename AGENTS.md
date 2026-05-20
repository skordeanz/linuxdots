# linuxdots

GNU Stow dotfiles for Omarchy/Arch Linux.

## Structure

Each top-level directory is a Stow package mirroring `$HOME` paths:

```
<package>/.config/<app>/<files>
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
./restow          # re-stow all packages
./restow -n       # dry run
./restow --adopt  # adopt live configs into stow tree
```

## Conventions

- 2-space indentation for scripts
- Theme files tracked directly (not symlinked)
- XDG paths preserved inside packages
