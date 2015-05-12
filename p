#!/bin/zsh

# zsh じゃないと $LINES がない

if [ $# -ne 1 ]; then
    echo "usage: $0 [FILE]"
    exit 0
fi

file=$1
line_of_file=$(wc -l $file | awk '{ print $1 }')

if [ $line_of_file -gt $LINES ]; then
    less $file
else
    cat $file
fi
