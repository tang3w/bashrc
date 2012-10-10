#!/bin/bash
# Author by Tang Tianyong
# Email to tang3w at Gmail
# Bash profiles for git


. $PATH_TO_SCRIPT_COMM/git.header.sh

# ((( Git synchronize
gs(){
    local yon ret
    cd $PATH_TO_ROOT
    git status | grep -s "^nothing to commit" > /dev/null && {
        cd - > /dev/null
        return 1
    }
    git status
    read -p "Quit or continue commit and push? (q|<Enter>): " yon
    [[ -n $yon && ${yon:0:1} = "q" ]] && {
        cd - > /dev/null
        return 1
    }
    git add . && git commit -a && git push
    ret=$?
    cd - > /dev/null
    return ret
}
# )))
