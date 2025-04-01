#!/usr/bin/env bash

if tmux info &> /dev/null; then 
  echo "tmux already running. Exiting."
  exit 1
fi

tmux new-session -A -d -t monitor
tmux rename-window -t monitor:1 htop
tmux send-keys -t monitor:htop htop Enter
tmux new-window -t monitor -n scratchpad
tmux select-window -t monitor:htop

tmux new-session -A -d -c ~/Notes -t home
tmux rename-window -t home:1 notes
