export PATH=$HOME/.local/bin:/usr/local/bin:/usr/local/sbin:$PATH
export EDITOR='subl -w'

### mise — single version manager for node, ruby, python
eval "$(mise activate zsh)"

### direnv
eval "$(direnv hook zsh)" 

### Google Cloud SDK
# shell command completion
gcloud_completion='/opt/homebrew/Caskroom/gcloud-cli/latest/google-cloud-sdk/completion.zsh.inc'
[ -f "$gcloud_completion" ] && source "$gcloud_completion"

# VSCode
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

### postgres command-line
export PATH=/opt/homebrew/opt/postgresql@18/bin:$PATH
alias pgstart="brew services start postgresql@18"
alias pgstop="brew services stop postgresql@18"

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
