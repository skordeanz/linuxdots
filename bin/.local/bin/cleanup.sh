#!/usr/bin/env bash
# cleanup.sh — routine cleanup for Arch/Omarchy (run monthly)
set -euo pipefail

title() { printf '\n\033[1m %s\033[0m\n' "$1"; }
ok()    { printf '\033[1;32m ✔\033[0m \033[36m%s\033[0m\n' "$1"; }

title "System cleanup"

sudo journalctl --vacuum-time=2weeks >/dev/null 2>&1 || true
ok "Journal trimmed to 2 weeks"

out=$(sudo paccache -rk0 2>&1 | tail -1 || true)
saved=$(printf '%s' "$out" | grep -oP '(?<=saved: ).*(?=\))' || true)
ok "Package cache wiped${saved:+ ($saved freed)}"

yay -Scc --noconfirm >/dev/null 2>&1 || true
ok "AUR build cache cleared"

orphans=$(pacman -Qtdq || true)
if [[ -n "$orphans" ]]; then
  n=$(wc -l <<< "$orphans" | tr -d ' ')
  sudo pacman -Rns --noconfirm $orphans >/dev/null 2>&1 || true
  yay -Yc --noconfirm >/dev/null 2>&1 || true
  ok "$n orphaned package(s) removed"
else
  ok "No orphaned packages"
fi

before=$(du -sb ~/.cache 2>/dev/null | cut -f1); before=${before:-0}
find ~/.cache -mindepth 1 -maxdepth 1 \
  ! -name 'spotify' ! -iname '*spicetify*' -exec rm -rf {} +
after=$(du -sb ~/.cache 2>/dev/null | cut -f1); after=${after:-0}
freed=$(numfmt --to=iec $((before - after)))
ok "User cache cleaned ($freed freed)"

old=$(sudo find /var/lib/systemd/coredump -type f -mtime +7 2>/dev/null || true)
if [[ -n "$old" ]]; then
  n=$(wc -l <<< "$old" | tr -d ' ')
  sudo find /var/lib/systemd/coredump -type f -mtime +7 -delete 2>/dev/null || true
  ok "$n old crash dump(s) pruned"
else
  ok "No old crash dumps"
fi

disk=$(df -h / | awk 'NR==2 {print $3 " of " $2 " (" $5 ")"}')
ok "Disk used: $disk"
echo

# Manual checks:
# expac -H M '%m\t%n' | sort -h | tail -20   # biggest installed packages
# systemctl --failed                         # failed services after updates
# pacman -Qkk | grep -v '0 altered files'    # package integrity check (slow)
