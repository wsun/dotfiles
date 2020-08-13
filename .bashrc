export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export EDITOR='subl -w'

### rbenv
eval "$(rbenv init -)"

### direnv
eval "$(direnv hook zsh)" 

### Added by Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# React Native android setup
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

### Google Cloud SDK
# update PATH
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
# shell command completion
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

# VSCode
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

### postgres start and stop
### manually link specific version of postgresql
export PATH=/usr/local/opt/postgresql@11/bin:$PATH
alias pgstart="pg_ctl -D /usr/local/var/postgresql@11 start"
alias pgstop="pg_ctl -D /usr/local/var/postgresql@11 stop"

### manually link mysql 5.7
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# setup NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# setup yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# pyenv-virtualenv auto-activation
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# get current IP address
alias ip="ipconfig getifaddr en0"

# tag a new git version
tag() {
	if [ "$#" -ne 1 ]; then
	  echo "Usage: tag [0.1.3]"
	  return 1
	fi
	GIT_COMMITTER_DATE="$(git show --format=%aD | head -1)"
	git tag -a "v$1" -m \""v$1"\"
}