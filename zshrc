# -*- mode: shell-script -*-

# Path to your oh-my-zsh installation.
export ZSH=/Users/amitu/.oh-my-zsh

# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# use hyphen-insensitive completion. Case sensitive completion must be 
# off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# enable command auto-correction.
ENABLE_CORRECTION="true"

# display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# disable marking untracked files under VCS as dirty. This makes 
# repository status check for large repositories much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

# User configuration

export CDPATH=~:~/projects:~/coverfox:.
export EDITOR="emacsclient -nw"

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin/"
source $ZSH/oh-my-zsh.sh

# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true
# global pip
gpip() {
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

# after every 'cd', perform 'ls' if cd succeeded
cdls() {
    if [ -z "$*" ]  # if $* is not set
    then
        builtin cd && ls
    else
        builtin cd "$*" && ls
    fi
}
alias cd="cdls"

if which pyenv > /dev/null;
then
    eval "$(pyenv init -)";
    eval "$(pyenv virtualenv-init -)"
fi
