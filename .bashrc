export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export EDITOR='subl -w'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

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

# if you installed SDK via Homebrew, otherwise ~/Library/Android/sdk
export ANDROID_HOME=/usr/local/opt/android-sdk

# for direnv via homebrew
eval "$(direnv hook bash)"

### Google Cloud SDK
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/apollo/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/apollo/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/apollo/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/apollo/google-cloud-sdk/completion.zsh.inc'; fi
