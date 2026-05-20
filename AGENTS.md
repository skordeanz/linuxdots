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
./restow          # re-stow all packages
./restow -n       # dry run
./restow --adopt  # adopt live configs into stow tree
```

## Conventions

- 2-space indentation for scripts
- Theme files tracked directly (not symlinked)
- XDG paths preserved inside packages
