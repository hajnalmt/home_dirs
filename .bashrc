#######################################################
# This file is my default CYGWIN .bashrc file
# written by Mate Hajnal
#
# Sections:
#   -> General
#   -> Shell Options
#   -> Completition Options
#   -> History Options
#   -> Aliases
#   -> Functions
#######################################################

###########
# General #
###########
# Default interaction prompt set to
# "'Hostname' 'Full pathname of current directory'$"
export PS1='\h \w$ '

# Set strict umask for users
if [[ "${USER}" == "root" ]] ; then
  umask 077  # strict umask for root
else
  umask 007  # normal user
fi

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

#################
# Shell Options #
#################
#
# See man bash for more options...
#
# Don't wait for job termination notification
set -o notify

# Don't use ^D to exit
set -o ignoreeof

# Use case-insensitive filename globbing
shopt -s nocaseglob

# Make bash append rather than overwrite the history on disk
shopt -s histappend
#
# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
shopt -s cdspell

######################
# Completion Options #
######################
# These completion tuning parameters change the default behavior of bash_completion:
#
# Define to access remotely checked-out files over passwordless ssh for CVS
COMP_CVS_REMOTE=1
#
# Define to avoid stripping description in --option=description of './configure --help'
COMP_CONFIGURE_HINTS=1

# Define to avoid flattening internal contents of tar files
COMP_TAR_INTERNAL_PATHS=1

# Uncomment to turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
[[ -f /etc/bash_completion ]] && . /etc/bash_completion

###################
# History Options #
###################

# Don't put duplicate lines in the history.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups

# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well

# Set up the size of the historymm and the time format 
export HISTSIZE=10000
export HISTTIMEFORMAT="%F_%T "

# Whenever displaying the prompt, write the previous line to disk
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

###########
# Aliases #
###########
# Some people use a different file for aliases
if [ -f "${HOME}/.bash_aliases" ]; then
    source "${HOME}/.bash_aliases"
fi

# Interactive operation...
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Default to human readable figures
alias df='df -h'
alias du='du -h'

# Misc :)
alias less='less -r'                          # raw control characters
alias whence='type -a'                        # where, of a sort
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour

# Some shortcuts for different directory listings
alias ls='ls -hF --color=tty'                 # classify files in colour
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
alias ll='ls -l'                              # long list
alias la='ls -A'                              # all but . and ..
alias l='ls -CF'                              #


#############
# FUNCTIONS #
#############
# Some people use a different file for functions
if [ -f "${HOME}/.bash_functions" ]; then
    source "${HOME}/.bash_functions"
fi

# Language settings 
function en() {
    LANG=en_EN.utf8
    "${@}"
}
function hu() {
    LANG=hu_HU.utf8
    "${@}"
}

# Colorful prompt
rcPrompt() {
    rc=$?
    if [ $rc -eq 0 ] ; then
        PS1="\e[0;33;1m\d \t \033[1;32;1m${rc} \e[0;31;1m\u\e[1;37;0m@\h:\e[0;32;1m\w\e[0;33;1m \e[0;37;0m\n"
    else
        PS1="\e[1;33;41m\d \t \033[1;37;40m ${rc} \e[1;31;41m \u\e[1;37;41m@\h:\e[1;32;41m\w\e[0;33m \e[0;37;0m\n"
    fi
}
PROMPT_COMMAND=rcPrompt
