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

### bottom powerline with history
preexec () {
    # delete old prompt; one "\e[1A\e[K" per line of $PS1
    for (( i=0, l=$(echo -e $PS1 | wc -l) ; i < l ; i++ ))
    do
        echo -ne "\e[1A\e[K"
    done
    # replacement for prompt
    echo -ne "\e[37;2m[`date +"%Y-%m-%d %H:%M:%S"`] \e[0m"
    echo -ne "\e[31;1m$USER$ \e[0m"
    echo -n "$1"
    echo -e "\e[0m"
}
preexec_invoke_exec () {
    [ -n "$DONTCLEANPROMPT" ] && return
    DONTCLEANPROMPT=x
    [ -n "$COMP_LINE" ] && return  # do nothing if completing
    [ "$BASH_COMMAND" = "$PROMPT_COMMAND" ] && return # don't cause a preexec for $PROMPT_COMMAND
    local this_command=`history 1 | sed -e "s/^[ ]*[0-9]*[ ]*//g"`;
    [ "$BASH_COMMAND" = "_update_ps1" ] && local this_command=""
    local this_pwd=${PWD/#$HOME/\~}
    preexec "$this_command" "$this_pwd"
}
trap 'preexec_invoke_exec' DEBUG
function _update_ps1() {
       export PS1="\[\e[$LINES;1H\]$(/opt/powerline-shell/powerline-shell.py $? 2> /dev/null)"
    }

PROMPT_COMMAND='_update_ps1; unset DONTCLEANPROMPT'