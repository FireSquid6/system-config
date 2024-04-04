#!/bin/sh


if [ -z "$1" ]; then
    echo "Usage: $0 <tag>"
    exit 1
fi

git tag -a $1 -m "version $1"
git push origin $1

