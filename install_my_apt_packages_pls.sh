#!/bin/sh
# Use this script to setup hajnalmt's most used packages on a debian based system
##############################################################################
sudo apt-get update -y

# Install Docker's package dependencies.
sudo apt-get install -y\
    curl git bash-completion

if [ ! -d "$HOME/.asdf" ]; then
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.9.0
    echo "source $HOME/.asdf/asdf.sh" >>~/.bashrc
    echo "source $HOME/.asdf/completions/asdf.bash" >>~/.bashrc
    . $HOME/.asdf/asdf.sh
    . $HOME/.asdf/completions/asdf.bash
fi





