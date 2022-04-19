#!/usr/bin/env bash

# stop on error
set -e

# clone dotfiles repo
echo $'\n########\nclone dotfiles repo\n'

if type gh > /dev/null 2>&1; then
  gh repo clone microsoft/extend-bash-commands ~/.ebc
else
  git clone https://github.com/microsoft/extend-bash-commands.git ~/.ebc
fi

# make ebc persistent
echo -e "\n\nsource ~/.ebc/.bash_helpers.sh\n\nsetup_extensions\n\n" >> ~/.bashrc

# done
echo $'\n########\ndone\n'
