#!/bin/bash

###############################################################################

# DESCRIPTION: Install standard packages, python packages, etc.
# NOTE:        This script has to be executed with sudo.
# AUTHOR:      Rabensteiner Alexander
# DATE:        27.03.2019

###############################################################################

### Add external PPAs ###
PATH_TO_PPAS='externalPPAs.dat' # file with the external PPAs needed for the following installation
while read -r LINE; do
    # Skip loop when comment (line beginning with #) or empty
    [ "${LINE:0:1}" == "#" ] || [ "$LINE" = '' ] && continue
    # Some output to terminal for logging
    echo "[ $(date +%F\ %T) ] Adding $LINE to external PPAs list."
    # Add PPA
    add-apt-repository $LINE -y
done < $PATH_TO_PPAS

#### Update package information ####
apt-get update 2>/dev/null
apt-get upgrade -y 2>/dev/null

#### Install packages ####
PATH_TO_PACKAGES='packagesToInstall.dat' # file with a list of packages to install on my system
while read -r LINE; do
    # Skip loop when comment (line beginning with #) or empty
    [ "${LINE:0:1}" == "#" ] || [ "$LINE" = '' ] && continue
    # Some output to terminal for logging
    echo "[ $(date +%F\ %T) ] Installing package $LINE to system."
    # Install package
    apt-get install $LINE -y
done < $PATH_TO_PACKAGES

### Do some stuff after install ###
# Start tlp
tlp start
# Some cleanup
apt-get update
apt-get upgrade -y
apt-get autoremove -y
# Create keeperfile with the files installed
debfoster -q

### Some Python3 essentials ###
PATH_TO_PYTON3='python3Packages.dat' # file with list of python3 packages to install on my system
while read -r LINE; do
    # Skip loop when comment (line beginning with #) or empty
    [ "${LINE:0:1}" == "#" ] || [ "$LINE" = '' ] && continue
    # Some output to terminal for logging
    echo "[ $(date +%F\ %T) ] Installing python package $LINE with pip3."
    # Install package
    pip3 install $LINE 
done < $PATH_TO_PYTON3

