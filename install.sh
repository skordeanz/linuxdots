#!/usr/bin/env bash
# Symlink dotfiles into $HOME with GNU Stow.
#
#   ./install.sh                # restow every package
#   ./install.sh hypr nvim      # restow only the named packages
set -euo pipefail
cd "$(dirname "$0")"

packages=("$@")
if [ "${#packages[@]}" -eq 0 ]; then
  # Every top-level directory is a stow package (dot-dirs like .attic are skipped).
  mapfile -t packages < <(find . -maxdepth 1 -mindepth 1 -type d ! -name '.*' -printf '%f\n' | sort)
fi

exec stow -t "$HOME" -R "${packages[@]}"
