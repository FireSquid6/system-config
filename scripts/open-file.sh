#!/usr/bin/env bash

project=$1
file=$2
pipe=""

# iterate through the parts of $project
for part in $(echo "$project" | tr "/" "\n"); do
  pipe="$HOME/.pipes/$part/socket.pipe"

  if [ -e "$pipe" ]; then
    break
  fi
done

nvim --server "$pipe" --remote-send "<CMD>e $file<CR>"
