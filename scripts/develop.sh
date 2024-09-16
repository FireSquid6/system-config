#!/usr/bin/env bash


appname="ink-nvim"
server=false
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
    -s|--server)
      shift
      server=true
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

if [ "$server" = true ]; then
  eval "NVIM_APPNAME=$appname" nvim --listen /tmp/godot.pipe "$file"
else
  eval "NVIM_APPNAME=$appname" nvim "$file"
fi
