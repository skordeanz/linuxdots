# linuxdots

GNU Stow dotfiles for Omarchy/Arch Linux.

## Structure

Each top-level directory is a Stow package mirroring `$HOME` paths:

```
<package>/.config/<app>/<files>
```

## Packages

| Package | Purpose |
|---------|---------|
| [hypr](hypr/.config/hypr/) | Window manager |
| [waybar](waybar/.config/waybar/) | Status bar |
| [bash](bash/) | Shell |
| [starship](starship/.config/) | Prompt |
| [git](git/.config/git/) | VCS |
| [ghostty](ghostty/.config/ghostty/) | Terminal |
| [walker](walker/.config/walker/) | Launcher |
| [nvim](nvim/.config/nvim/) | Editor |
| [mpv](mpv/.config/mpv/) | Media player |
| [lazygit](lazygit/.config/lazygit/) | Git TUI |
| [fastfetch](fastfetch/.config/fastfetch/) | System info |
| [xdg](xdg/.config/) | Default apps, dirs |

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
