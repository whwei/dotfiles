#!/usr/bin/env bash
# One-shot setup for a fresh macOS machine (Apple Silicon).
#
#   git clone git@github.com:whwei/dotfiles.git ~/dotfile
#   ~/dotfile/install.sh
#
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "==> 1/4 Homebrew"
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo "==> 2/4 Brew packages (includes stow)"
brew bundle --file="$DOTFILES/Brewfile"

echo "==> 3/4 Symlink configs with stow"
cd "$DOTFILES"
stow ghostty nvim yazi zsh git

echo "==> 4/4 npm global packages"
if command -v npm >/dev/null 2>&1; then
  xargs npm install -g < npm-globals.txt
else
  echo "SKIP: npm not found — install Node first, then:"
  echo "  xargs npm install -g < $DOTFILES/npm-globals.txt"
fi

echo
echo "Done! Manual steps remaining:"
echo "  1. SSH keys:   scp -r old-machine:~/.ssh/id_ed25519* ~/.ssh/   (or ssh-keygen, add to GitHub)"
echo "  2. Secrets:    create ~/.zshrc.local with your API keys (copy from old machine — not in repo)"
echo "  3. Toolchains: install uv / bun / deno / rustup / ghcup / foundry fresh"
echo "  4. Restart:    exec zsh"
