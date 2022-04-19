#!/usr/bin/env bash

# stop on error
set -e

# clone dotfiles repo
echo $'\n########\nclone dotfiles repo\n'

if type gh > /dev/null 2>&1; then
  gh repo clone microsoft/amplify ~/.amplify
else
  git clone https://github.com/microsoft/amplify.git ~/.amplify
fi

# make amplify persistent
echo -e "\n\nsource ~/.amplify/.bash_helpers.sh\n\nsetup_extensions\n\n" >> ~/.bashrc

# done
echo $'\n########\ndone\n'
