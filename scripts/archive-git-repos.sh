#!/usr/bin/env bash

cd /etc/nixos/archiver || exit


bun run archiver.ts
