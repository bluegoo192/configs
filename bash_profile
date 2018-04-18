parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

parse_folder() {
    echo $1 | sed -e 's/^.*\///'
} 

if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

alias npm-exec='PATH=$(npm bin):$PATH'

# PROMPT_COMMAND='echo -ne "\033]0;$(basename `dirname $PWD`)/$(basename $PWD)\007"'
# PROMPT_COMMAND='echo -ne "\033]0;$(basename $PWD) $(parse_git_branch)\007"'

export PGUSER="ngnl@sparkshowings-dev-database"
export PGHOST="sparkshowings-dev-database.postgres.database.azure.com"
export PGPASSWORD="fortnite>league1"
export PGDATABASE="postgres"
export PGPORT=5432
export FIXIE_SOCKS_HOST="fixie:kvGbFh88mUtTkvU@speedway.usefixie.com:1080"

export PS1="\n\[\033[35m\]λ \[\033[36m\]\$(parse_folder \W)\[\033[32m\]\$(parse_git_branch)\[\033[00m\]: "
export PS2="    : "
export ANDROID_HOME=/Users/Arthur/Library/Android/sdk
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/tools:$PATH
export NVM_DIR="$HOME/.nvm"
export PATH=$PATH:~/bin
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
PATH="/Users/Arthur/Library/google-cloud-sdk/path.bash.inc:${PATH}"
export PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

alias ls='ls -GFh'

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

function eacp() {
    git add .
    git commit -m "$1"
    git push  
}

PS1="\033]0;$(basename $PWD) $(parse_git_branch)\007${PS1}"
trap 'echo -ne "\033]0;$(basename $PWD) | $BASH_COMMAND\007"' DEBUG
