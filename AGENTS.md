# Repository Guidelines

## Project Structure & Organization
This repository is a GNU Stow-based dotfiles setup for Omarchy on Arch Linux with Hyprland. Each top-level directory is a Stow package that mirrors paths under `$HOME`.

- Package examples: `hypr/`, `waybar/`, `nvim/`, `bash/`, `starship/`
- Internal layout pattern: `<package>/.config/<app>/<file>` (e.g. `waybar/.config/waybar/config.jsonc`)
- Dotfiles at home root: `bash/.bashrc` stows to `~/.bashrc`
- Scripts at repo root: `restow` for stow management

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

## Build, Test, and Development Commands
No compile/build step. Validate by stowing and checking links.

- `./restow` — re-stows all packages with `stow -D` then `stow`
- `./restow -n` — dry-run to preview changes without writing links
- `./restow --adopt` — adopt existing target files into stow tree (review diffs after)
- `stow -Dv <pkg>` — unstow a package cleanly
- `stow -nv <pkg>` — dry-run for a single package

## Coding Style & Conventions
- Shell scripts use Bash with `set -euo pipefail`
- Use 2-space indentation
- Name package directories after the tool/app (`hypr`, `waybar`, `nvim`)
- Preserve XDG-style paths (`.config/...`) inside package directories
- Theme files tracked directly (resolved copies, not symlinks to omarchy system dirs)

## Testing Guidelines
No formal test framework. Use operational checks:

1. Run `./restow -n` before making changes
2. Apply with `./restow`
3. Verify symlinks: `ls -l ~/.config/waybar`
4. Check files resolve correctly: `file ~/.config/hypr/hyprland.conf`

## Commit Guidelines
- Short, imperative messages scoped to what changed
- Keep one logical change per commit
- Mention affected packages in commit body when relevant
