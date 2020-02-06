## Setup
### Setting up iTerm2 and zsh
See https://gist.github.com/kevin-smets/8568070
1. Install iterm2
```
brew cask install iterm2
```
2. Select Solarized Dark colors by visiting Preferences / Profiles / Colors / Load Presets
3. Install Oh My Zsh
```
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
4. Install [Powerline fonts](https://github.com/powerline/fonts)
5. Set up .zshrc

### Setting up Python
1. Install pyenv and pyenv-virtualenv
```
brew install pyenv pyenv-virtualenv
```
2. Install desired python version
```
pyenv install 3.7.1
```
3. Set up virtualenv for a project
```
pyenv virtualenv [version] [name]
```
4. Set up .bashrc with virtualenv auto-activation

### Setting up Ruby
1. Install rbenv and ruby-install
```
brew install rbenv ruby-install
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

### Setting up Postgres
1. Install postgres and postico.
```
brew install postgresql
brew cask install postico
```
2. Set up .zshrc with ```pgstart``` and ```pgstop``` commands


### Setting up Node
1. Install NVM and target node version
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
nvm install lts/erbium
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

## Casks
- 1password
- amazon-drive
- calibre
- coconutbattery
- dropbox
- evernote
- firefox
- google-backup-and-sync
- google-chrome
- google-cloud-sdk
- handbrake
- id3-editor
- iexplorer
- iterm2
- java8
- mactex
- mamp
- onedrive
- postico
- postman
- rocket-typist
- rescuetime
- sequel-pro
- sketch
- skype
- slack
- spotify
- sqlitebrowser
- steam
- sublime-text
- the-unarchiver
- virtualbox
- visual-studio-code
- vlc
- whatsapp

## Programs
- garmin express
- xcode
- office 2019
- utorrent
- ie10 virtualbox tester

## Global npm modules
- create-react-app
- nodemon
- react-native-cli
- sequelize-cli
