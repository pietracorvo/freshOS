#!/bin/bash

###############################################################################

# DESCRIPTION: Configure bash by manipulating ~/.bashrc
# AUTHOR:      Rabensteiner Alexander
# DATE:        04.11.2018

###############################################################################

# Activate prompt color
sed -i.bak '/^#force_color_prompt=.*/ s/^#//' ~/.bashrc

# Don't show hostname
sed -i '/.*PS1=.*@\\h\\\[.*]:.*/ s/@\\h\\\[.*]:/:/' ~/.bashrc
sed -i '/.*PS1=.*@\\h\:.*/ s/@\\h//' ~/.bashrc

