#!/usr/bin/env bash
# Bootstrap a new machine from these dotfiles:
#   1. install Homebrew if missing
#   2. install everything in the Brewfile (apps, CLIs, fonts, mise)
#   3. symlink the dotfiles into $HOME (including ~/.config/mise/config.toml)
#   4. install the global runtimes pinned in ~/.config/mise/config.toml
#
# Safe to re-run — existing correct symlinks are left alone, and anything else
# is backed up to <file>.backup before linking.
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
STAMP="$(date +%Y%m%d%H%M%S)"

# 1. Homebrew
if ! command -v brew >/dev/null 2>&1; then
  echo "==> Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null || /usr/local/bin/brew shellenv)"
fi

# 2. Brewfile
echo "==> brew bundle install"
brew bundle install --file "$DOTFILES/Brewfile" || \
  echo "⚠️  brew bundle had failures (usually unsigned App Store 'mas' apps) — continuing"

# 3. Symlink dotfiles
echo "==> Linking dotfiles into $HOME"
for f in .bash_profile .bashrc .gitconfig .hushlogin .vimrc .zshrc; do
  src="$DOTFILES/$f"
  dest="$HOME/$f"
  [ -e "$src" ] || continue
  if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
    continue
  fi
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    echo "    backing up existing $dest -> $dest.backup.$STAMP"
    mv "$dest" "$dest.backup.$STAMP"
  fi
  ln -s "$src" "$dest"
  echo "    linked $f"
done

# 4. mise global config
echo "==> Linking ~/.config/mise/config.toml"
mise_src="$DOTFILES/.config/mise/config.toml"
mise_dest="$HOME/.config/mise/config.toml"
mkdir -p "$HOME/.config/mise"
if [ -L "$mise_dest" ] && [ "$(readlink "$mise_dest")" = "$mise_src" ]; then
  echo "    already linked"
else
  if [ -e "$mise_dest" ] || [ -L "$mise_dest" ]; then
    echo "    backing up existing $mise_dest -> $mise_dest.backup.$STAMP"
    mv "$mise_dest" "$mise_dest.backup.$STAMP"
  fi
  ln -s "$mise_src" "$mise_dest"
  echo "    linked .config/mise/config.toml"
fi

# 5. mise global runtimes (node, ruby, python)
echo "==> mise install"
mise install

# 6. Node's package managers via Corepack (yarn/pnpm)
mise exec -- corepack enable

echo "==> Done. Open a new shell. Remaining manual steps:"
echo "    - App Store: sign in before re-running if you added 'mas' apps (brew bundle can't sign in for you)"
echo "    - Install Oh My Zsh:  sh -c \"\$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\""
echo "    - iTerm2: set font to MesloLGS Nerd Font, load Solarized Dark preset"
