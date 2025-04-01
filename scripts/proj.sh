#!/usr/bin/env bash

PROJECT=$1

if [ -z "$PROJECT" ]; then
    echo "Usage: proj.sh <project>"
    exit 1
fi

# check if project is actually "new"
if [ "$PROJECT" == "new" ]; then
  tmux new-window -t workbench -n new -c ~/source
    exit 1
fi

# check if the project exists
if [ ! -d ~/source/"$PROJECT" ]; then
    echo "Creating project directory"
    mkdir ~/source/"$PROJECT"
fi

# create a new tmux session for the project
echo "Opening ~/source/$PROJECT"
tmux new-session -t workbench -n "$PROJECT" -c ~/source/"$PROJECT"
