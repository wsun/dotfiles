## Setup
### Setting up iTerm2 and zsh
See https://gist.github.com/kevin-smets/8568070
1. Install iterm2
```brew cask install iterm2```
2. Select Solarized Dark colors by visiting Preferences / Profiles / Colors / Load Presets
3. Install Oh My Zsh
```sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"```
4. Install [Powerline fonts](https://github.com/powerline/fonts)
5. Set up .zshrc

### Setting up Python
1. Install python from homebrew. Note: this installs Python 2, available as python2.
```brew install python```
2. Set up .bashrc so python2 shadows system python
3. Install virtualenv and virtualenvwrapper
```pip install virtualenv```
```pip install virtualenvwrapper```

### Setting up Ruby
1. Install rbenv and ruby-install
```brew install rbenv ruby-install```
2. Set up .bashrc (in place of running ```rbenv init```)
3. Install relevant ruby versions, by running
```rbenv install [version #, e.g. 2.3.3]```
4. Ensure shims all work by running
```rbenv rehash```
5. Set up global bundler.
```gem install bundler```

### Setting up Node
1. Install node and redis.
```brew install node redis```

### Setting up direnv
1. Install direnv
```brew install direnv```

## Casks
firefox
google-chrome
1password
slack
smcFanControl
flux
rescuetime
coconutbattery
dropbox
onedrive
google-backup-and-sync
amazon-drive
sublime-text
sketch
simplenote
evernote
visual-studio-code
the-unarchiver
skype
whatsapp
handbrake
vlc
calibre
spotify
iexplorer
mactex
sequel-pro
sqlitebrowser
mamp
postico
id3-editor

## Programs
garmin express
hots
xcode
adobe cs6
office 2011
utorrent
ie10 virtualbox tester

## Global npm modules
create-react-app
nodemon
react-native-cli
sequelize-cli