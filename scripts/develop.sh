#!/usr/bin/env bash

appname="ink-nvim"
file=""

while [[ $# -gt 0 ]]
do
  key="$1"
  case $key in
    -c|--config)
      shift
      appname="$1"
      shift
      ;;
    -f|--file)
      shift
      file="$1"
      shift
      ;;
    *)
      shift
      ;;
  esac
done

# get the last part of the file path
dir=$(basename "$(pwd)")
pipe="$HOME/.pipes/$dir/socket.pipe"
mkdir -p "$(dirname "$pipe")"

eval "NVIM_APPNAME=$appname" nvim --listen "$pipe" "$file"
