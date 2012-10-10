#!/bin/bash
# Author by Tang Tianyong
# Email to tang3w at Gmail
# This file provide some JB development functions


# Include the header
. $PATH_TO_SCRIPT_IOS/JB.header.sh

# ((( Connect to JB device
# Make a ssh tunnel to JB device
# Usage: itunnel [-i <iPhone/iPod port>] [-l <local port>]
# Default ports are declared in tang3w.JBDev.define.sh
itunnel(){
    local iport lport OPTIND=1

    while getopts :i:l: opt; do
        case $opt in
            i)  isuint $OPTARG && iport=$OPTARG || return 1 ;;
            l)  isuint $OPTARG && lport=$OPTARG || return 1 ;;
            :)  return 1 ;;
        esac
    done

    iport=${iport:-"$DEFAULT_ITUNNEL_IPORT"}
    lport=${lport:-"$DEFAULT_ITUNNEL_LPORT"}

    # Dependency: itnl
    # http://code.google.com/p/iphonetunnel-usbmuxconnectbyport/
    itnl --iport $iport --lport $lport

    return $?
}
# )))


# ((( SSH to JB Device
# You should execute itunnel function before
# Usage: issh [ -p <local port> ] [ -u <user name> ] [ -h <JB device ip> ]
issh(){
    local lport iuser ihost OPTIND=1

    while getopts :p:u:h: opt; do
        case $opt in
        u)  iuser=$OPTARG ;;
        p)  isuint $OPTARG && lport=$OPTARG || return 1 ;;
        h)  isipv4 $OPTARG && ihost=$OPTARG || return 1 ;;
        :)  return 1 ;;
        esac
    done

    lport=${lport:-"$DEFAULT_ITUNNEL_LPORT"}
    iuser=${iuser:-"$DEFAULT_ITUNNEL_IUSER"}
    ihost=${ihost:-"$DEFAULT_ITUNNEL_IHOST"}

    ssh -p $lport "${iuser}@${ihost}"

    return $?
}
# )))


# ((( Secure copy files or directorys to directory in JB device
# This function hide the details like port or file type
# You can copy multiple files and directories at the same time
# Usage: iscp dir1 file1 file2 dir2 ... /User/Dev
# Options:
#   [ -u <iPhone/iPod user> ]
#   [ -h <iPhone/iPod host> ]
#   [ -l <local port> ]
#   [ -d <dir of JB device> ]
iscp(){
    local iuser ihost lport ipath OPTIND=1

    while getopts :u:h:l:d: opt; do
        case $opt in
            u)  iuser=$OPTARG ;;
            h)  isipv4 $OPTARG && ihost=$OPTARG || return 1 ;; 
            l)  isuint $OPTARG && lport=$OPTARG || return 1 ;;
            d)  ipath=$OPTARG ;;
            :)  return 1 ;;
        esac
    done

    iuser=${iuser:-"$DEFAULT_ITUNNEL_IUSER"}
    ihost=${ihost:-"$DEFAULT_ITUNNEL_IHOST"}
    lport=${lport:-"$DEFAULT_ITUNNEL_LPORT"}
    ipath=${ipath:-"$DEFAULT_ISCP_PATH"}
    
    shift $((OPTIND - 1))

    # At least two arguments
    [ $# -lt 1 ] && return 1

    # Secure copy files
    scp -r -P $lport -- "$@" "${iuser}@${ihost}:${ipath}"

    return $?
}
# )))
