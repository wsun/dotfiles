## Setup
### Setting up iTerm2 and zsh
See https://gist.github.com/kevin-smets/8568070
1. Install iterm2
```
brew install --cask iterm2
```
2. Select Solarized Dark colors by visiting Preferences / Profiles / Colors / Load Presets
3. Install Oh My Zsh
```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
4. Install [Powerline fonts](https://github.com/powerline/fonts) and set Preferences / Profiles / Text / Font to Meslo LG M for Powerline, size 10
5. Set up .zshrc
6. Install [autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md)

### Setting up Python
1. Install pyenv and pyenv-virtualenv
```
brew install pyenv pyenv-virtualenv
```
2. Install desired python version
```
pyenv install 3.9.7
```
3. Set up virtualenv for a project
```
pyenv virtualenv [version, e.g. 3.9.7] [name, e.g. project-env]
```
4. Set up .bashrc with virtualenv auto-activation
5. Set up .python-version with version/virtualenv details, e.g. '3.7.1/envs/project-env'

### Setting up Ruby
1. Install rbenv
```
brew install rbenv
```
2. Set up .bashrc (in place of running ```rbenv init```)
3. Install relevant ruby versions, by running
```
rbenv install [version #, e.g. 2.3.3]
```
4. Ensure shims all work by running
```
rbenv rehash
```
5. Set up global bundler.
```
gem install bundler
```
6. Install cocoapods via Homebrew to access `pod`
```
brew install cocoapods
```

### Setting up Postgres
1. Install postgres and postico.
```
brew install postgresql
brew install --cask postico
```
2. Set up .zshrc with ```pgstart``` and ```pgstop``` commands


### Setting up Node
1. Install NVM and target node version
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
nvm install lts/gallium
```
2. Install yarn directly (homebrew version includes node)
```
curl -o- -L https://yarnpkg.com/install.sh | bash
```
3. Set up .bashrc
4. Install redis
```
brew install redis
```

### Setting up direnv
1. Install direnv
```
brew install direnv
```

### Setting up Chrome
Turn off dark mode bars
```
defaults write com.google.Chrome NSRequiresAquaSystemAppearance -bool yes
```

## Casks
- 1password
- calibre
- coconutbattery
- firefox
- google-drive
- google-chrome
- google-cloud-sdk
- handbrake
- iexplorer
- iterm2
- mactex
- mamp
- onedrive
- postico
- postman
- rocket-typist
- rescuetime
- sequel-pro
- skype
- slack
- spotify
- sqlitebrowser
- steam
- sublime-text
- the-unarchiver
- transmit
- virtualbox
- visual-studio-code
- vlc

## Programs
- garmin express
- xcode
- office 2019
- utorrent
- ie10 virtualbox tester

## Global npm modules
- create-react-app
- nodemon
- sequelize-cli
