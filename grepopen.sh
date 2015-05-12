#!/bin/bash -euxv

if [ $# -ne 1 ]; then
    echo "usage: $0 [REGEX]"
    exit 0
fi

regex=$1
ag_line=$(ag $1 | peco)

file=$(echo $ag_line | cut -d: -f1)
line=$(echo $ag_line | cut -d: -f2)

emacsclient -n $file +$line
