
# Make life easy
if [[ -n `uname -a | grep -i mac` ]]
then
    echo "MAC"
    alias ls='ls -G'
else
    echo "NOT MAC"
    alias ls='ls --color=auto'
fi

alias ..="cd .."
alias ll='ls -l'
alias e="exit"
alias grep='grep --color=auto'

# Creates a local scripts directory if one does not exists (and adds a bin
# subdirectory to the path to easily use user defined scripts) I normally
# just symlink things that live elsewhere into the bin directory
SCRIPTS_PATH=~/scripts/bin
if [ ! -d $SCRIPTS_PATH ]
then
    mkdir -p $SCRIPTS_PATH
fi
export PATH=$PATH:$SCRIPTS_PATH


##############################################################################
# Source Control Changes
export SVN_EDITOR=/usr/bin/vim

if [[ -f ~/scripts/bin/gen-cscope-db ]]
then
    alias gen-cscope-db='source gen-cscope-db'
fi

##############################################################################
#Command prompt changes
smiley() {
EXITVAL=$?
if [ $EXITVAL -eq 0 ]
then
	echo  -e "\e[1;34m0\e[m"
else
	echo -e "\e[0;31mX($EXITVAL)\e[m"
fi
}

# Based off a script by epopovich@isilon.com
git_pretty() {
    BRANCH=$(git branch 2>/dev/null | grep "^\* " | cut -d" " -f2)
    if [ "$BRANCH" == "" ]
    then
        VAR=""
    else
        GIT_DIR=$(git rev-parse --show-toplevel)
        REPO_NAME=$(basename "$GIT_DIR")
        VAR="$REPO_NAME <$BRANCH>"
        GIT_STATUS=`git status`

        if [ "`echo $GIT_STATUS | egrep \"Changes not staged for commit|Changes to be committed|Changed but not updated\"`" == "" ]
        then
            GIT_NOT_STAGED=""
        else
            GIT_NOT_STAGED="$(tput setaf 1)*$(tput sgr0)"
        fi

        if [ "`echo $GIT_STATUS | egrep \"Your branch is ahead of\"`" == "" ]
        then
            GIT_AHEAD_OF=""
        else
            GIT_AHEAD_OF="$(tput setaf 3)*$(tput sgr0)"
        fi

        if [ "`echo $GIT_STATUS | egrep \"Your branch.*have diverged\"`" == "" ]
        then
            GIT_DIVERGE=""
        else
            GIT_DIVERGE="$(tput setaf 1)XXX$(tput sgr0)"
        fi

        if [ "`echo $GIT_STATUS | egrep \"Your branch is behind\"`" == "" ]
        then
            GIT_BEHIND=""
        else
            GIT_BEHIND="[$(tput setaf 2)*$(tput sgr0)"
        fi

        if [ "`echo $GIT_STATUS | egrep \"Untracked files:\"`" == "" ]
        then
            GIT_UNTRACKED=""
        else
            GIT_UNTRACKED="[$(tput setaf 1)U$(tput sgr0)"
        fi

        VAR="$VAR$GIT_UNTRACKED$GIT_NOT_STAGED$GIT_AHEAD_OF$GIT_DIVERGE$GIT_BEHIND"
    fi

    echo $VAR
}

# git completion!
source ~/.git-completion.bash

PS1='\[\033[1;36m\][\!::\H::\W] [$(git_pretty)\[\033[1;36m\]]]\n-->\[\033[0m\]'

##############################################################################
# Spotify cmdline control
# https://gist.github.com/wandernauta/6800547

if [ -f ~/scripts/bin/sp ]
then
    alias splay='sp play'
    alias lock='sp pause && gnome-screensaver-command -l'
fi

################################################################################
# SSH
################################################################################
if [ -f ~/.ssh/id_rsa ]
then
    eval $(ssh-agent -s)
    ssh-add ~/.ssh/id_rsa
fi

################################################################################
# Local to each box stuff...
source ~/.bashrc_local 2>/dev/null # And I don't care if it doesn't exist

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
