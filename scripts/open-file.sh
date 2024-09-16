#!/usr/bin/env bash

project=$1
file=$2

# iterate through the parts of $project


nvim --server "$pipe" --remote-send "<CMD>e $file<CR>"
