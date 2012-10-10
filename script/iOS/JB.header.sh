#!/bin/bash
# Author by Tang Tianyong
# Email to tang3w at Gmail
# Definition of JBDev.sh


# Default iPhone/iPod user
declare -r DEFAULT_ITUNNEL_IUSER="root"

# Default iPhone/iPod host
declare -r DEFAULT_ITUNNEL_IHOST="localhost"

# Default iPhone/iPod itunnel port
declare -r DEFAULT_ITUNNEL_IPORT=22

# Default local itunnel port
declare -r DEFAULT_ITUNNEL_LPORT=2222

# Default Secure copy path
declare -r DEFAULT_ISCP_PATH="/var/root/JBDev"

# Default SSH login path
declare -r DEFAULT_SSH_LOGON_DIR=$DEFAULT_ISCP_PATH

# Default command after logon
declare -r DEFAULT_LOGON_COMMAND="cd $DEFAULT_SSH_LOGON_DIR"
