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

########
# Init #
########
INITIAL_WORKING_DIR = $(pwd)
# Go to HOME and at the end go back to current dir
cd $HOME

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

####################
# Home Directories #
####################
if [ ! -d "$HOME/home_dirs" ]; then
    git clone git@github.com:hajnalmt/home_dirs.git $HOME/home_dirs
fi

# Go back to the initial directory and exit
cd $INITIAL_WORKING_DIR
exit


###########
# Plugins #
###########
# Awesome vimrc install
if [ ! -d "$HOME/.vim_runtime" ]; then
    git clone https://github.com/amix/vimrc.git\
        $HOME/.vim_runtime
    chmod +x $HOME/.vim_runtime/install_awesome_vimrc.sh
    sh $HOME/.vim_runtime/install_awesome_vimrc.sh

    # Copy my additional vim config to the awesome one.
    cp $HOME/temp/vim/my_configs.vim $HOME/.vim_runtime/
fi

# Tmux Plugin Manager
if [ ! -d "$HOME/.tmux" ]; then
    git clone https://github.com/tmux-plugins/tpm\
        $HOME/.tmux/plugins/tpm
fi
