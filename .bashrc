
# Make life easy
alias ..="cd .."
alias ls='ls --color=auto'
alias ll='ls -l'
alias e="exit"

SCRIPTS_PATH=/home/$(whoami)/scripts/bin
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

PS1='\[\033[1;36m\][\!::\H::\W] [$(smiley)\[\033[1;36m\]]\n-->\[\033[0m\]'

##############################################################################
# Isilon Stuffs
if [ -d ~/ssd/svn/onefs ]
then
    export QA=/usr/local/qa
    export TOOLS=/usr/local/tools
    export QALIB=$QA/lib
    export PERL5LIB=$QA/lib
    export PATH=$QA/bin:$QA/tests:$QA/linux/bin:$TOOLS:$PATH
    [ -z "$PS1" ] && route_fix
fi


##############################################################################
# Spotify cmdline control
# https://gist.github.com/wandernauta/6800547

if [ -f ~/scripts/bin/sp ]
then
    alias splay='sp play'
fi
