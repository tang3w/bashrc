#!/bin/bash
# Author by Tang Tianyong
# Email to tang3w at Gmail
# This file implement some basic functions used by other scripts


# ((( Headers
. $PATH_TO_SCRIPT_COMM/utils.header.sh
# )))


# ((( New shell scripts
# Create new scripts with Doc Comments
# Usage: nsh [scrip1 script2 ...]
nsh(){
    # At least one file name
    if [ $# -lt 1 ]; then
        echo "Usage: nsh [script1 script2 ...]"
        return 1
    fi

    # Create multiple scripts at the same time
    for filename in "$@"; do
        if [ -f $filename ]; then
            echo "Failure: file $filename has existed"
        else
            local tmpl=$PATH_TO_SH_EMPTY_TEMPLATE
            if [[ -z $tmpl || ! -r $tmpl ]]; then
                echo "Can not find shell template file"
                return 1
            else
                cp $tmpl ./$filename
                if [ $? -eq 0 ]; then
                    echo "${PWD}/$filename"
                fi
            fi
        fi
    done

    return $?
}
# )))


# ((( Validation function
# This function provide a validation template
# You can use it to validate various type by given regular expression
# Usage: is reg var1 var2 ...
# Typically, you can give $@ to it like: is reg "$@"
is(){
    # At least two arguments
    # The regular expression can't be empty
    if [[ $# -lt 2 || -z $1 ]]; then
        return 1;
    fi

    local reg=$1; shift

    for val in "$@"; do
        if [[ ! $val =~ $reg ]]; then
            return 1
        fi
    done

    return 0
}
# )))


# ((( are numbers valid
# Validate numbers, you can test multiple numbers
# Usage: isnum [number1 number2 ...]
isuint(){
    return $(is "$UINT_REGULAR_EXPRESSION" "$@")
}
# )))


# ((( are IPv4 valid
# Validate IPv4, you can test multiple IPv4
# Usage: isipv4 [ip1 ip2 ...]
isipv4(){
    return $(is "$IPV4_REGULAR_EXPRESSION" "$@")
}
# )))
