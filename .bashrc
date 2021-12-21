export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export EDITOR='subl -w'

### rbenv
eval "$(rbenv init -)"

### direnv
eval "$(direnv hook zsh)" 

### Google Cloud SDK
# update PATH
source '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
# shell command completion
source '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

# VSCode
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

### postgres command-line (createdb)
export PATH=/opt/homebrew/opt/postgresql@12/bin:$PATH
alias pgstart="brew services start postgresql@12"
alias pgstop="brew services stop postgresql@12"

### manually link mysql 5.7
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# setup NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# setup yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# pyenv-virtualenv auto-activation
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# get current IP address, copy to pasteboard
alias ip="ipconfig getifaddr en0 | tr -d '\n' | pbcopy"

# tag a new git version
tag() {
	if [ "$#" -ne 1 ]; then
	  echo "Usage: tag [0.1.3]"
	  return 1
	fi
	GIT_COMMITTER_DATE="$(git show --format=%aD | head -1)"
	git tag -a "v$1" -m \""v$1"\"
}
