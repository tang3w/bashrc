#!/bin/bash
# Author by Tang Tianyong
# Email to tang3w at Gmail
# Bash profiles for git


. $PATH_TO_SCRIPT_COMM/git.header.sh

# ((( Git synchronize
gs(){
    local yon repo ret OPTIND=1
    local usage="Usage: gs [-h] [-r <repo>]"
    while getopts :hr: opt; do
        case $opt in
        :)  echo $usage; return 1 ;;
        h)  echo $usage; return 0 ;;
        r)  repo=$OPTARG ;;
        esac
    done
    repo=${repo:-"$DEFAULT_SYNC_REPO"}
    [ -d "$repo" ] && cd $repo || {
        echo "Error: repository not found"
        return 1
    }
    git status &> /dev/null
    [ $? -ne 0 ] && {
        git status
        return $?
    }
    git status | grep -s "^nothing to commit" > /dev/null && {
        git status
        git pull
        cd - > /dev/null
        return 1
    }
    git status
    echo -n "Quit or continue commit and push? (q|<Enter>): "
    read yon
    [[ -n $yon && ${yon:0:1} = "q" ]] && {
        cd - > /dev/null
        return 1
    }
    git pull && git add . && git commit -a && git push
    ret=$?
    cd - > /dev/null
    return $ret
}
# )))
