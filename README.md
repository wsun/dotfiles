# dotfiles

## Quick start (new machine)

```
git clone <this repo> ~/dotfiles
cd ~/dotfiles
./install.sh
```

`install.sh` installs Homebrew, runs `brew bundle` (apps, CLIs, fonts, mise),
symlinks the dotfiles into `$HOME`, installs the global runtimes pinned in
`~/.config/mise/config.toml`, installs Oh My Zsh, and enables Corepack. Then
finish the manual steps it prints.

## Runtimes — mise

A single tool ([mise](https://mise.jdx.dev)) manages Node, Ruby, and Python —
it replaces pyenv, rbenv, and nvm. It reads `.nvmrc` / `.node-version` /
`.ruby-version` automatically and switches versions on `cd`; no shims.

- Global versions live in `~/.config/mise/config.toml` (Node LTS + Ruby 3.4 +
  Python 3.13); the file is tracked in this repo and symlinked by `install.sh`.
- Per-project versions live in that project's `mise.toml` or idiomatic version
  files.
- `mise install` installs everything in scope; `mise use -g node@lts` pins a
  global; `mise use node@22` pins the current project.

**Python note:** mise is configured _not_ to read `.python-version`. Manage Python per-project with a `mise.toml`:

```toml
[tools]
python = "3.11"

[env]
_.python.venv = { path = ".venv", create = true }
```

`cd` into the repo and mise creates/activates `.venv`; then
`pip install -r requirements.txt`.

## Apps — Brewfile

All apps, CLIs, and fonts are declared in the `Brewfile`.

```
brew bundle install --file ~/dotfiles/Brewfile   # restore
brew bundle dump --describe --force --file ~/dotfiles/Brewfile   # regenerate from current machine
brew bundle check --file ~/dotfiles/Brewfile     # verify all present
```

## Shell — iTerm2 + Oh My Zsh

See https://gist.github.com/kevin-smets/8568070

1. iTerm2 comes from the Brewfile. Load the **Solarized Dark** preset:
   Preferences → Profiles → Colors → Load Presets.
2. Set the font to **MesloLGS Nerd Font** (from the `font-meslo-lg-nerd-font`
   cask in the Brewfile) so the `agnoster` theme's glyphs render:
   Preferences → Profiles → Text → Font.
3. `zsh-autosuggestions` is loaded as an Oh My Zsh custom plugin (see `.zshrc`).

## Postgres

`pgstart` / `pgstop` aliases (in `.bashrc`) start/stop the service.

## Chrome

Turn off dark-mode bars:

```
defaults write com.google.Chrome NSRequiresAquaSystemAppearance -bool yes
```
