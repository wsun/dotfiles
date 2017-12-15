export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export EDITOR='subl -w'

### homebrew python2 shadow system python
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

### rbenv
eval "$(rbenv init -)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# protect global pip installs, special function to allow
export PIP_REQUIRE_VIRTUALENV=true
gpip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

# config for virtualenvwrapper
export WORKON_HOME=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# React Native android setup
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

# for direnv via homebrew
eval "$(direnv hook zsh)"

### Google Cloud SDK
# update PATH
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
# shell command completion
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

# VSCode
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

### postgres start and stop
alias pgstart="pg_ctl -D /usr/local/var/postgres start"
alias pgstop="pg_ctl -D /usr/local/var/postgres stop"

### manually link node 8 LTS
export PATH="/usr/local/opt/node@8/bin:$PATH"

