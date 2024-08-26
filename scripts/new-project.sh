#!/usr/bin/env bash


NAME=$1
FLAKE=$2
AIRDROP=$3


if [ -z "$NAME" ]; then
  echo "Usage: $0 <project-name> <flake> <airdrop>"
  exit 1
fi

if [ -z "$FLAKE" ]; then
  echo "Usage: $0 <project-name> <flake> <airdrop>"
  exit 1
fi

create the project
mkdir "$HOME/source/$NAME"
cd "$HOME/source/$NAME"

nixify.sh flake "$FLAKE"

if [ -n "$AIRDROP" ]; then
  # airdrop stuff if we want it
  airdrop.sh "$AIRDROP"
fi


proj.sh $NAME
git add .
git commit -m "Initial commit"
