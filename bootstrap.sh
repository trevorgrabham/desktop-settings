#!/bin/bash

# clone settings repo
git clone https://github.com/trevorgrabham/desktop-settings ~/.dotfiles

# add the lists, keys, sources, whatever I need to add repositories for google-chrome, wine, neovim, etc

# install packages
xargs sudo apt install -y < ~/.dotfiles/apt/installed-packages.txt

# link configs
mv ~/.bashrc ~/.bashrc.backup
mv ~/.profile ~/.profile.backup
mv ~/.bash_alias ~/.bash_alias.backup
mv ~/.gitconfig ~/.gitconfig.backup

ln -sf ~/.dotfiles/bashrc ~/.bashrc
ln -sf ~/.dotfiles/profile ~/.profile
ln -sf ~/.dotfiles/bash_alias ~/.bash_alias
ln -sf ~/.dotfiles/gitconfig ~/.gitconfig

# move all of the ~/.dotfiles/nvim files

# move all of the ~/.dotfiles/bin files

# move all of the ~/.dotfiles/systemd files

# enable all of the user timers and services 

# check all necessary languages installed and install as necessary
#   go
