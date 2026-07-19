#!/usr/bin/env bash
# bootstrap a new machine — tayloralessia207's baseline
set -euo pipefail

PKGS=(vim tmux git curl htop ripgrep fd-find jq)

if command -v apt-get >/dev/null; then
  sudo apt-get update
  sudo apt-get install -y "${PKGS[@]}"
elif command -v pacman >/dev/null; then
  sudo pacman -S --noconfirm "${PKGS[@]}"
else
  echo "unknown package manager" >&2
  exit 1
fi

# dotfiles
if [ ! -d "$HOME/dotfiles" ]; then
  git clone https://github.com/tayloralessia207/dotfiles.git "$HOME/dotfiles"
fi

echo "done."
