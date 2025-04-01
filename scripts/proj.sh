#!/usr/bin/env bash

PROJECT=$1

if [ -z "$PROJECT" ]; then
    echo "Usage: proj.sh <project>"
    exit 1
fi

# check if the project exists
if [ ! -d ~/source/"$PROJECT" ]; then
    echo "Creating project directory"
    mkdir ~/source/"$PROJECT"
fi

tmux has-session -t "$PROJECT" 2>/dev/null

if [ $? -ne 0 ]; then
    tmux new-session -d -t "$PROJECT" -c ~/source/"$PROJECT"
    tmux rename-window -t "$PROJECT":1 editor
fi

alacritty --command tmux attach-session -t "$PROJECT" &
