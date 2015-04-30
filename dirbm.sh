#!/bin/bash

BOOKMARK_FILE=$HOME/.dir_bookmark

add_bookmark() {
    local dir=$(pwd)

    touch $BOOKMARK_FILE
    if grep -e "^${dir}$" $BOOKMARK_FILE > /dev/null; then
        echo "\"$dir\" already exists in bookmark file."
    else
        echo $dir >> $BOOKMARK_FILE
        echo "Insert \"$dir\" to bookmark file."
    fi
}

cd_with_bookmark() {
    touch $BOOKMARK_FILE
    cd $(tac $BOOKMARK_FILE | peco)
}

edit_bookmark() {
    touch $BOOKMARK_FILE
    emacsclient -n $HOME/.dir_bookmark
}
