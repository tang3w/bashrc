#!/bin/bash
# Author by Tang Tianyong
# Email to tang3w at Gmail
# Init all bash profiles


# ((( Constants

# Root directory
declare -r ROOT_DIR="bashrc"

# Bin directory
declare -r BIN_DIR="bin"

# Scripts directory
declare -r SCRIPT_DIR="script"

# Template directory
declare -r TEMPLATE_DIR="template"

# Path to root directory
declare -r PATH_TO_ROOT=${PATH_TO_ROOT:-"$HOME/$ROOT_DIR"}

# Path to scripts dirrctory
declare -r PATH_TO_SCRIPT=${PATH_TO_SCRIPT:-"$PATH_TO_ROOT/$SCRIPT_DIR"}

# Path to template directory
declare -r PATH_TO_TEMPLATE=${PATH_TO_TEMPLATE:-"$PATH_TO_ROOT/$TEMPLATE_DIR"}

# )))


# ((( Add bin to PATH environment vairable
export PATH="$PATH:$PATH_TO_ROOT/bin"
# )))


# ((( Include common scripts
. $PATH_TO_SCRIPT/comm.sh
# )))

# ((( If on iOS device
if [ $PLATFORM = "iOS" ]; then
    . $PATH_TO_SCRIPT/iOS.sh
fi
# )))
