<p align="center">
  <img src="assets/linuxdots.svg" alt="linuxdots" width="600">
</p>

<p align="center">
  <img src="https://img.shields.io/badge/omarchy-8b5cf6?style=for-the-badge&labelColor=18181B"/>
  <img src="https://img.shields.io/badge/stow-18181B?style=for-the-badge&logo=gnu&logoColor=white&labelColor=18181B"/>
  <img src="https://img.shields.io/badge/arch-18181B?style=for-the-badge&logo=archlinux&logoColor=white&labelColor=18181B"/>
  <img src="https://img.shields.io/badge/hyprland-18181B?style=for-the-badge&logo=hyprland&logoColor=white&labelColor=18181B"/>
</p>

<p align="center">
  Personal dotfiles for <b>Omarchy</b> — an Arch Linux rice built on Hyprland.<br>
  Managed with GNU Stow for easy deployment on new machines.
</p>

---

## Quick Start

```bash
git clone git@github.com:skordeanz/linuxdots.git ~/.dotfiles
cd ~/.dotfiles
./restow
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

| Command | What it does |
|---------|-------------|
| `./restow` | Re-stow all packages |
| `./restow -n` | Dry run (no changes) |
| `./restow --adopt` | Overwrite stow tree with live configs |
