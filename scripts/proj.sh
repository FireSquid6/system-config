#!/usr/bin/env bash

echo "STUFF:"
echo $@
echo $0
echo $1
echo "END STUFF"

PROJECT=$1
echo $PROJECT

if [ -z "$PROJECT" ]; then
    echo "Usage: proj.sh <project>"
    exit 1
fi

# check if the project exists
if [ ! -d ~/source/$PROJECT ]; then
    mkdir ~/source/$PROJECT
fi

# create a new tmux session for the project
tmux new-window -t workbench -n $PROJECT -c ~/source/$PROJECT
