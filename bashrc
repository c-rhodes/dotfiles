# ~/.bashrc
# by Cullen Rhodes [rhodes.cullen@gmail.com]

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Only load Liquid Prompt in interactive shells, not from a script or from scp
[[ $- = *i* ]] && source ~/liquidprompt/liquidprompt

alias vi=vim
export EDITOR=vim
export TERM=xterm-256color

# Aliases
alias  mkdir='mkdir -p'

# Git tab completion
if [ ! -f ~/.git-completion.bash ]
  then
    echo "git-completion.bash does not exist, fetching.."
    wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -qO ~/.git-completion.bash
fi

source ~/.git-completion.bash

# Turn on advanced pattern matching
shopt -s extglob 

# History config
export HISTCONTROL=ignoreboth:erasedups # avoid duplicated in bash history
export HISTFILESIZE=                    # unlimited entries
export HISTSIZE=                        # unlimited entries
export HISTTIMEFORMAT="[%F %T] "        # add timestamps to history
shopt -s histappend                     # append to history, don't overwrite it

# Save and reload the history after each command finished
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# python virtualenv config
echo ""
if [ ! -f /usr/local/bin/virtualenvwrapper.sh ]
  then
    echo "virtualenvwrapper not found, fetching.."
    pip install --user virtualenvwrapper
fi

export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# ssh-agent config
SSH_ENV=$HOME/.ssh/environment

# start the ssh-agent
function start_agent {
    echo "Initializing new SSH agent..."
    # spawn ssh-agent
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > ${SSH_ENV}
    echo succeeded
    chmod 600 ${SSH_ENV}
    . ${SSH_ENV} > /dev/null
    /usr/bin/ssh-add
}

if [ -f "${SSH_ENV}" ]; then
     . ${SSH_ENV} > /dev/null
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

# find ruby executables
export PATH="$HOME/.gem/ruby/2.2.0/bin:$PATH"
