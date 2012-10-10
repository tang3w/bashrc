#!/bin/bash
# Author by Tang Tianyong
# Email to tang3w at Gmail
# Controller of all shell scripts


# ((( Initialize the configures

# Root directory
ROOT_DIR="tang3w"

# Bin directory
BIN_DIR="bin"

# Scripts directory
SCRIPT_DIR="script"

# Template directory
TEMPLATE_DIR="template"

# Path to root directory
PATH_TO_ROOT=${PATH_TO_ROOT:-"$HOME/$ROOT_DIR"}

# Path to scripts dirrctory
PATH_TO_SCRIPT=${PATH_TO_SCRIPT:-"$PATH_TO_ROOT/$SCRIPT_DIR"}

# Path to template directory
PATH_TO_TEMPLATE=${PATH_TO_TEMPLATE:-"$PATH_TO_ROOT/$TEMPLATE_DIR"}

# )))


# ((( Add bin to PATH environment vairable
export PATH="$PATH:$PATH_TO_ROOT/bin"
# )))


# ((( Include common scripts
. $PATH_TO_SCRIPT/comm.sh
# )))

# Include the utilities script
. $PATH_TO_SCRIPT/utils.sh
. $PATH_TO_SCRIPT/JBDev.sh
. $PATH_TO_SCRIPT/opt.sh
# )))

# ((( If on iOS device
if [ $PLATFORM = "iOS" ]; then
    . $PATH_TO_SCRIPT/iOS.sh
fi
# )))
