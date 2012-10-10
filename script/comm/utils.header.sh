#!/bin/bash
# Author by Tang Tianyong
# Email to tang3w at Gmail
# Define some constant(read only) variables

# Shell empty template - nsh
declare -r PATH_TO_SH_EMPTY_TEMPLATE="$PATH_TO_TEMPLATE/sh/empty.sh"

# Unsigned integer regular expression - isunit
declare -r UINT_REGULAR_EXPRESSION="^0$|^[1-9][0-9]*$"

# IPv4 regular expression
declare -r IPV4_REGULAR_EXPRESSION="^[0-9]{1,3}(\.[0-9]{1,3}){3}$|^localhost$"
