#!/bin/bash
# Author by Tang Tianyong
# Email to tang3w at Gmail
# Common bash profile header
 

# ((( Constants
declare -r PATH_TO_SCRIPT_COMM="${PATH_TO_SCRIPT}/comm"
declare -r PATH_TO_SCRIPT_LOOSE="${PATH_TO_SCRIPT}/loose"
declare -r PATH_TO_SCRIPT_IOS="${PATH_TO_SCRIPT}/iOS"
# )))

# ((( Shortcut for commands
alias ll="ls -A -l -h"
alias cdb="cd $PATH_TO_ROOT"
alias cds="cd $PATH_TO_SCRIPT"

alias cdc="cd $PATH_TO_SCRIPT_COMM"
alias cdl="cd $PATH_TO_SCRIPT_LOOSE"
alias cdi="cd $PATH_TO_SCRIPT_IOS"
# )))
