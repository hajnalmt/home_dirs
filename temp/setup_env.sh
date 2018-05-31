#!/bin/sh
##############################################################################
# This script is used to setup the environment
# installs the needed plugins etc...
# written by Mate Hajnal
#
# Sections:
#   -> General
#   -> Plugins
##############################################################################

###########
# General #
###########
# Some global directories
if [ ! -d "$HOME/projects" ]; then
    mkdir "$HOME/projects"
fi
if [ ! -d "$HOME/workspace" ]; then
    mkdir "$HOME/workspace"
fi
if [ ! -d "$HOME/temp" ]; then
    mkdir "$HOME/temp"
fi

###########
# Plugins #
###########
# Awesome vimrc install
if [ ! -d "$HOME/.vim_runtime" ]; then
    git clone --depth=1 https://github.com/amix/vimrc.git\
        $HOME/.vim_runtime
    sh $HOME/.vim_runtime/install_awesome_vimrc.sh
fi

# Tmux Plugin Manager
if [ ! -d "$HOME/.tmux" ]; then
    git clone https://github.com/tmux-plugins/tpm\
        $HOME/.tmux/plugins/tpm
    tmux source $HOME/.tmux.conf
fi
