#!/usr/bin/env bash
#
# linuxdots installer — stows this repo's packages into $HOME with GNU Stow.
#
# Safe to re-run: it updates the repo and restows.
#
#   ./install.sh                 install every package
#   ./install.sh hypr nvim zed   install only those packages
#   ./install.sh --list          list package names
#   ./install.sh --help          show usage

set -euo pipefail

REPO_URL="https://github.com/skordeanz/linuxdots.git"

usage() {
  cat <<'EOF'
Usage: install.sh [package...]

Stow linuxdots packages into $HOME. With no arguments, every package is
installed. Re-running is safe: it pulls the latest and restows.

  install.sh                  install everything
  install.sh hypr nvim zed    install only these packages
  install.sh --list           list package names
  install.sh --help           show this help
EOF
}

case "${1:-}" in
  -h|--help) usage; exit 0 ;;
esac

# Where is the repo? Prefer the directory this script lives in, so running it
# from a clone doesn't clone again. Otherwise it's ~/.linuxdots.
SELF="${BASH_SOURCE[0]:-}"
SCRIPT_DIR=""
if [ -n "$SELF" ] && [ -e "$SELF" ]; then
  SCRIPT_DIR="$(cd -- "$(dirname -- "$SELF")" && pwd)"
fi
if [ -n "$SCRIPT_DIR" ] && [ -f "$SCRIPT_DIR/install.sh" ] && [ -d "$SCRIPT_DIR/hypr" ]; then
  DOTS="$SCRIPT_DIR"
else
  DOTS="$HOME/.linuxdots"
fi

# --- get the repo -------------------------------------------------------------
FRESH_CLONE=false
if [ -d "$DOTS/.git" ]; then
  :
elif [ -e "$DOTS" ]; then
  echo "error: $DOTS exists but isn't a git clone" >&2
  exit 1
else
  echo "==> cloning into $DOTS"
  git clone "$REPO_URL" "$DOTS"
  FRESH_CLONE=true
fi

# --- which packages exist -----------------------------------------------------
mapfile -t ALL_PKGS < <(find "$DOTS" -mindepth 1 -maxdepth 1 -type d ! -name .git -printf '%f\n' | sort)

if [ "${1:-}" = "--list" ]; then
  printf '%s\n' "${ALL_PKGS[@]}"
  exit 0
fi

# --- which packages were asked for --------------------------------------------
if [ "$#" -eq 0 ]; then
  PKGS=("${ALL_PKGS[@]}")
  WHAT="every package"
else
  PKGS=()
  for p in "$@"; do
    if [ ! -d "$DOTS/$p" ]; then
      echo "error: '$p' isn't a package in this repo" >&2
      echo "available: ${ALL_PKGS[*]}" >&2
      exit 1
    fi
    PKGS+=("$p")
  done
  WHAT="${PKGS[*]}"
fi

# --- do the asked-for packages need submodules? --------------------------------
NEED_SUBMODULES=false
while IFS= read -r sub_path; do
  [ -n "$sub_path" ] || continue
  sub_pkg="${sub_path%%/*}"
  for p in "${PKGS[@]}"; do
    [ "$p" = "$sub_pkg" ] && NEED_SUBMODULES=true
  done
done < <(git -C "$DOTS" config -f "$DOTS/.gitmodules" --get-regexp '^submodule\..*\.path$' 2>/dev/null | awk '{print $2}')

# --- update the repo (quiet about submodules we don't need) --------------------
if [ "$FRESH_CLONE" = false ]; then
  echo "==> updating $DOTS"
  git -C "$DOTS" -c submodule.recurse=false pull --ff-only \
    || echo "    (couldn't fast-forward, using this checkout as-is)"
fi

if [ "$NEED_SUBMODULES" = true ]; then
  echo "==> fetching plugin submodules"
  git -C "$DOTS" submodule update --init --recursive
fi

# --- GNU Stow -----------------------------------------------------------------
if ! command -v stow >/dev/null 2>&1; then
  echo "==> stow is missing"
  if command -v pacman >/dev/null 2>&1; then
    sudo pacman -S --needed --noconfirm stow
  else
    echo "error: install GNU Stow, then re-run" >&2
    exit 1
  fi
fi

# --- stow ---------------------------------------------------------------------
echo "==> stowing $WHAT into $HOME"
cd -- "$DOTS"
if ! stow -R -t "$HOME" "${PKGS[@]}"; then
  echo >&2
  echo "error: stow hit a conflict — a real file is already in the way." >&2
  echo "       Move or delete the target(s) listed above, then re-run." >&2
  exit 1
fi

echo "==> done"
