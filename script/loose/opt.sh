#!/bin/bash
# Author by Tang Tianyong
# Email to tang3w at Gmail
# This file provide some special but important functions


# Include header
. $PATH_TO_SCRIPT_LOOSE/opt.header.sh


# ((( Fuck the G+F=W
# This function ssh to vps to be ready for Switchy!
# Dependency chrome plugin: Swithy!
# Switchy url: http://switchy.samabox.com/
switchy(){
    local user host port OPTIND=1

    while getopts :u:h:p: opt; do
        case $opt in
        u)  user=$OPTARG ;;
        h)  isipv4 $OPTARG && host=$OPTARG || return 1 ;;
        p)  isuint $OPTARG && host=$OPTARG || return 1 ;;
        :)  return 1 ;;
        esac
    done

    user=${user:-"$DEFAULT_SWITCHY_USER"}
    host=${host:-"$DEFAULT_SWITCHY_HOST"}
    port=${port:-"$DEFAULT_SWITCHY_PORT"}

    # Connect to vps
    ssh -N -D $port $user@$host

    return $?
}
# )))
