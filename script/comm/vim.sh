#!/bin/bash
# Author by Tang Tianyong
# Email to tang3w at Gmail
# Vim bash profiles 


. $PATH_TO_SCRIPT_COMM/vim.header.sh

# ((( Update .vimrc in $HOME
update_vimrc(){
    if ! [ -f "$HOME/.vimrc" ] ||
       ! diff "$HOME/.vimrc" $PATH_TO_VIMRC > /dev/null; then
        # Over white .vimrc if possible
        # Be sure that, vimrc.vim is the latest version
        cp $PATH_TO_VIMRC $HOME
        cp -R $PATH_TO_VIMRS $HOME
    fi

    return $?
}
update_vimrc
# )))
