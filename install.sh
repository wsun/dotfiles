#!/usr/bin/env bash
# Bootstrap a new machine from these dotfiles:
#   1. install Homebrew if missing
#   2. install everything in the Brewfile (apps, CLIs, fonts, mise)
#   3. symlink the dotfiles into $HOME (including ~/.config/mise/config.toml)
#   4. install Oh My Zsh if missing
#   5. install the global runtimes pinned in ~/.config/mise/config.toml
#   6. install standalone coding CLIs
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

# 4. Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "==> Installing Oh My Zsh"
  RUNZSH=no CHSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "==> Oh My Zsh already installed"
fi

# 4b. zsh-autosuggestions (third-party oh-my-zsh plugin referenced in .zshrc)
autosuggest_dir="$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
if [ ! -d "$autosuggest_dir" ]; then
  echo "==> Installing zsh-autosuggestions"
  git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions "$autosuggest_dir"
else
  echo "==> zsh-autosuggestions already installed"
fi

# 5. mise global config
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

# 5b. Sublime Text user preferences
echo "==> Linking Sublime Text Preferences.sublime-settings"
subl_src="$DOTFILES/sublime/Preferences.sublime-settings"
subl_dest="$HOME/Library/Application Support/Sublime Text/Packages/User/Preferences.sublime-settings"
mkdir -p "$(dirname "$subl_dest")"
if [ -L "$subl_dest" ] && [ "$(readlink "$subl_dest")" = "$subl_src" ]; then
  echo "    already linked"
else
  if [ -e "$subl_dest" ] || [ -L "$subl_dest" ]; then
    echo "    backing up existing $subl_dest -> $subl_dest.backup.$STAMP"
    mv "$subl_dest" "$subl_dest.backup.$STAMP"
  fi
  ln -s "$subl_src" "$subl_dest"
  echo "    linked sublime/Preferences.sublime-settings"
fi

# 5c. Sublime Text git commit message settings (syntax-specific)
echo "==> Linking Sublime Text Git Commit.sublime-settings"
gitcommit_src="$DOTFILES/sublime/Git Commit.sublime-settings"
gitcommit_dest="$HOME/Library/Application Support/Sublime Text/Packages/User/Git Commit.sublime-settings"
mkdir -p "$(dirname "$gitcommit_dest")"
if [ -L "$gitcommit_dest" ] && [ "$(readlink "$gitcommit_dest")" = "$gitcommit_src" ]; then
  echo "    already linked"
else
  if [ -e "$gitcommit_dest" ] || [ -L "$gitcommit_dest" ]; then
    echo "    backing up existing $gitcommit_dest -> $gitcommit_dest.backup.$STAMP"
    mv "$gitcommit_dest" "$gitcommit_dest.backup.$STAMP"
  fi
  ln -s "$gitcommit_src" "$gitcommit_dest"
  echo "    linked sublime/Git Commit.sublime-settings"
fi

# 6. mise global runtimes (node, ruby, python)
echo "==> mise install"
mise install

# 7. Node's package managers via Corepack (yarn/pnpm)
mise exec -- corepack enable

# 8. Claude Code CLI (native installer -> ~/.local/bin, self-updating)
if ! command -v claude >/dev/null 2>&1; then
  echo "==> Installing Claude Code"
  curl -fsSL https://claude.ai/install.sh | bash
else
  echo "==> Claude Code already installed"
fi

# 9. Codex CLI (official standalone installer -> ~/.local/bin)
if ! command -v codex >/dev/null 2>&1; then
  echo "==> Installing Codex CLI"
  mkdir -p "$HOME/.local/bin"
  curl -fsSL https://chatgpt.com/codex/install.sh | CODEX_NON_INTERACTIVE=1 CODEX_INSTALL_DIR="$HOME/.local/bin" sh
else
  echo "==> Codex CLI already installed"
fi
codex --version

echo "==> Done. Open a new shell. Remaining manual steps:"
echo "    - App Store: sign in before re-running if you added 'mas' apps (brew bundle can't sign in for you)"
echo "    - iTerm2: set font to MesloLGS Nerd Font, load Solarized Dark preset"
