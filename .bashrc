
# Make life easy
alias ..="cd .."
alias ls='ls --color=auto'
alias ll='ls -l'
alias e="exit"
export PATH=$PATH:/home/jwisdom/scripts/bin

##############################################################################
# Source Control Changes
#git shortcuts
#alias com="git commit -a -m"
#alias push="git push origin master"
#alias pull="git pull master origin"

export SVN_EDITOR=/usr/bin/vim
if [ -f ~/cscope.out ]
then
    export CSCOPE_DB=~/cscope.out
else
    echo "NO CSCOPE_DB, generate and/or set variable"
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

PS1='\[\033[1;36m\][\#::\H::\W] [$(smiley)\[\033[1;36m\]]\n-->\[\033[0m\]'

##############################################################################
# Isilon Stuffs
export QA=/usr/local/qa
export TOOLS=/usr/local/tools
export QALIB=$QA/lib
export PERL5LIB=$QA/lib
export PATH=$QA/bin:$QA/tests:$QA/linux/bin:$TOOLS:$PATH

##############################################################################
# Not good for work, slows stuff down
#cd()
#{
#    builtin cd "${@:-$HOME}" && ls "--color=auto"
#}
#pushd()
#{
#    builtin pushd "${@}" && ls
#}



