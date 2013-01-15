#!/bin/bash
# Author by Tang Tianyong
# Email to tang3w at Gmail
# Init all bash profiles


# ((( Constants

# Bin directory name
declare -r BIN_DIR="bin"
# Scripts directory name
declare -r SCRIPT_DIR="script"
# Template directory name
declare -r TEMPLATE_DIR="template"

# Path to root directory
declare -r PATH_TO_ROOT=$(dirname $(readlink -nf $BASH_SOURCE))
# Path to scripts dirrctory
declare -r PATH_TO_SCRIPT="${PATH_TO_ROOT}/${SCRIPT_DIR}"
# Path to template directory
declare -r PATH_TO_TEMPLATE="${PATH_TO_ROOT}/${TEMPLATE_DIR}"

# ((( Add bin directory to PATH
export PATH="$PATH:$PATH_TO_ROOT/$BIN_DIR"
# )))

# )))

# ((( Include common scripts
. $PATH_TO_SCRIPT/comm.sh
# )))

# ((( If on iOS device
if [ $PLATFORM = "iOS" ]; then
    . $PATH_TO_SCRIPT/iOS.sh
fi
# )))

# ((( If on PC or MAC
# Let's say the platform is "loose"
if [ $PLATFORM = "loose" ]; then
    . $PATH_TO_SCRIPT/loose.sh
fi
# )))
