#!/bin/bash

###############################################################################

# DESCRIPTION: Configure bash by manipulating ~/.bashrc
# AUTHOR:      Rabensteiner Alexander
# DATE:        04.11.2018
# NOTE:	       Needs no sudo rights

###############################################################################

# If no backup exists make one
if ! [ -f ~/.bashrc.bckp ]; then
    cp ~/.bashrc ~/.bashrc.bckp
fi

# Activate prompt color
#sed -i '/^#force_color_prompt=.*/ s/^#//' ~/.bashrc

# Don't show hostname
#sed -i '/.*PS1=.*@\\h\\\[.*]:.*/ s/@\\h\\\[.*]:/:/' ~/.bashrc
#sed -i '/.*PS1=.*@\\h\:.*/ s/@\\h//' ~/.bashrc

# Record much more bash commands to track myself
sed -i '/^HISTFILESIZE=.*/ s/=.*/=20000/' ~/.bashrc


# TODO: Maybe also add the following line (if it has no side effect) 
export PATH=/usr/local/bin:$PATH # needed e.g. to use brew
