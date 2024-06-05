#!/usr/bin/env bash
touch .envrc

if test -f ./flake.nix; then
  echo "Found a flake.nix. Using that for the .envrc"
  echo -e "use flake" >> .envrc
else
  echo "No flake.nix found. Using nix-shell for the .envrc"
  echo -e "use nix" >> .envrc
fi

if grep -Fxq ".envrc" .gitignore
then
  echo ".envrc already in .gitignore"
else
  echo ".envrc not in .gitignore. Adding it."
  echo ".envrc" >> .gitignore
fi

direnv allow 
