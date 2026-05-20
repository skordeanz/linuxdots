# linuxdots

Omarchy dotfiles managed with GNU Stow.

## Usage

```bash
git clone git@github.com:skordeanz/linuxdots.git ~/.dotfiles
cd ~/.dotfiles
./restow
```

## Packages

| Category | Packages |
|----------|----------|
| WM | hypr, waybar |
| Shell | bash, starship, git |
| Apps | ghostty, walker, nvim, mpv, lazygit |
| System | fastfetch, xdg |

## Commands

```bash
./restow       # re-stow all packages
./restow -n    # dry run
./restow --adopt  # overwrite stow tree with live configs
```
