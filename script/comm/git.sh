#!/bin/bash
# Author by Tang Tianyong
# Email to tang3w at Gmail
# Bash profiles for git


. $PATH_TO_SCRIPT_COMM/git.header.sh

# ((( Git synchronize
gs(){
    cd $PATH_TO_ROOT
    git add . && git commit -a && git push
    cd -
}
# )))
