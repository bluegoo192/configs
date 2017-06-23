parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

parse_folder() {
    echo $1 | sed -e 's/^.*\///'
} 


export PS1="\[\033[35m\]λ \[\033[36m\]\$(parse_folder \W)\[\033[32m\]\$(parse_git_branch)\[\033[00m\]: "
export PS2="    : "
export ANDROID_HOME=/Users/Arthur/Library/Android/sdk
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/tools:$PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

alias ls='ls -GFh'

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

function eacp() {
    git add .
    git commit -m "$1"
    git push origin master
}
