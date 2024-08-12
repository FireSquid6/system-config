#!/usr/bin/env bash

if tmux info &> /dev/null; then 
  echo "tmux already running. Exiting."
  exit 1
fi

# workbench contains just a basic session I use for programming projects
tmux new-session -d -c ~/source -t workbench

# automatically put a starting project in nixos
tmux rename-window -t workbench:1 scratch
tmux new-window -t workbench -n nixos -c /etc/nixos
tmux select-window -t workbench:scratch

# monitor just has htop and a blank pane
tmux new-session -d -t monitor
tmux rename-window -t monitor:1 htop
tmux send-keys -t monitor:htop htop Enter
tmux new-window -t monitor -n scratchpad
tmux select-window -t monitor:htop

# home is a basic session for personal stuff
tmux new-session -d -c ~ -t home
tmux rename-window -t home:1 scratch
