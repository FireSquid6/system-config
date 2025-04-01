#!/usr/bin/env bash

if tmux info &> /dev/null; then 
  echo "tmux already running. Exiting."
  exit 1
fi

tmux new-session -d -t home
tmux rename-window -t home:1 htop
tmux send-keys -t home:htop htop Enter

tmux new-window -t home -n scratchpad
tmux new-window -t home -n notes -c ~/Notes

tmux select-window -t home:htop
