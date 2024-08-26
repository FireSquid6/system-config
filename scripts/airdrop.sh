#!/usr/bin/env bash


if [ -z "$1" ]; then
    echo "Usage: $0 <directory>"
    echo "Possible Directories:"
    ls /etc/nixos/airdrops
    exit 1
fi


DIRECTORY=/etc/nixos/airdrops/"$1"


if [ ! -d "$DIRECTORY" ]; then
    echo "$DIRECTORY not found"
    exit 1
fi


echo "The following files will be copied:"
find "$DIRECTORY" -type f

read -p "Do you want to continue? [y/N] " -n 1 -r
echo ""


if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Aborting"
    exit 1
fi


for file in $(find "$DIRECTORY" -type f); do
    cp -v "$file" .
done
