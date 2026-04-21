#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
config_src="$repo_root/nvim"
config_dst="$HOME/.config/nvim"

if [[ ! -d "$config_src" ]]; then
  echo "Missing $config_src" >&2
  exit 1
fi

mkdir -p "$HOME/.config"

if [[ -e "$config_dst" && ! -L "$config_dst" ]]; then
  backup="$HOME/.config/nvim.bak.$(date +%Y%m%d-%H%M%S)"
  echo "Backing up existing $config_dst -> $backup"
  mv "$config_dst" "$backup"
elif [[ -L "$config_dst" ]]; then
  echo "Removing existing symlink $config_dst"
  rm "$config_dst"
fi

ln -s "$config_src" "$config_dst"
echo "Installed: $config_dst -> $config_src"

echo "Next: start nvim; lazy.nvim will bootstrap and install plugins on demand."
