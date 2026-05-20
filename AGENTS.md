# linuxdots

GNU Stow dotfiles for Omarchy/Arch Linux.

## Structure

Each top-level directory is a Stow package mirroring `$HOME` paths:

```
<package>/.config/<app>/<files>
```

## Packages

- **wm**: hypr, waybar
- **shell**: bash, starship, git
- **apps**: ghostty, walker, nvim, mpv, lazygit
- **system**: fastfetch, xdg

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
