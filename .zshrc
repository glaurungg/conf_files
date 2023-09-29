# Make life easy
if [[ -n `uname -a | grep -i -e mac -e Darwin` ]]
then
    alias ls='ls -G'
else
    alias ls='ls --color=auto'
fi

alias kc='kubectl'
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

bindkey -e # bash like features, like ^r == reverse search

# Kube
export KUBE_EDITOR="$(which vim)"

# Function definitions
export FPATH="$HOME/.zsh/autoload:$FPATH"
autoload -Uz +X awsc
autoload -Uz +X git_pretty
autoload -Uz +X arthur_env
autoload -Uz +X unset_aws_vault

# Source Control Changes
export EDITOR=/usr/bin/vim
zstyle ':completion:*:*:git:*' script ~/.git-completion.bash
autoload -U compinit && compinit

# PS1 changes
autoload -U colors
colors
autoload -U git_pretty awsc

reset_color="%{$reset_color%}"
cyan="%{$fg[cyan]%}"
green="%{$fg[green]%}"
red="%{$fg[red]%}"
blue="%{$fg[blue]%}"

# export CLICOLOR=1
setopt PROMPT_SUBST
setopt promptsubst
function precmd() {
  local profile=$(echo $AWS_DEFAULT_PROFILE)
  local newline=$'\n'
  PS1="${cyan}[%?::%d][${red}${AWS_DEFAULT_PROFILE}${cyan}][${green}$(kubectl config current-context)${cyan}][\$(git_pretty)${cyan}]]${newline}-->${reset_color}"
}

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Non committed changes
source $HOME/.zshrc_local

export PATH="$PATH:/Users/joshua.wisdom/Library/Python/3.8/bin"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/Cellar/tfenv/2.2.3/versions/0.14.7/terraform terraform

export HDW_AIRFLOW_ROOT=/Users/joshua.wisdom/git/harrys-data-warehouse/airflow/harrys_airflow

# Created by `pipx` on 2022-10-31 18:27:04
export PATH="$PATH:/Users/joshua.wisdom/.local/bin"

# poetry
alias activate_poetry="source \"\$(poetry env list --full-path | grep Activated | cut -d' ' -f1 )/bin/activate\""

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/joshua.wisdom/scripts/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/joshua.wisdom/scripts/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/joshua.wisdom/scripts/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/joshua.wisdom/scripts/google-cloud-sdk/completion.zsh.inc'; fi
