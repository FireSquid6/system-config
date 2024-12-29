#!/usr/bin/env bash

# set the safe variables
export AWS_ACCESS_KEY_ID=DO0093ARD8DZJZGPKW37
export AWS_DEFAULT_REGION=nyc3

export AWS_ENDPOINT_URL=https://nyc3.digitaloceanspaces.com
export AWS_DEFAULT_BUCKET=firesquidpersonal

# this script is checked into git, so we have to keep the secret key in a differnt file
if [ ! -f ~/.dokey ]; then
  echo "$HOME/.dokey not found. Please fill this file with your secret key"
  exit 1
fi


AWS_SECRET_ACCESS_KEY=$(cat "$HOME/.dokey")
export AWS_SECRET_ACCESS_KEY


stu --bucket firesquidpersonal
