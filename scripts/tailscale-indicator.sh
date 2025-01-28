#!/usr/bin/env bash

if tailscale status --peers=false | grep -q "$(hostname)"; then
  echo "󰖂 $(hotname) "
else
  echo "󰖂 $(hostname)"
fi
