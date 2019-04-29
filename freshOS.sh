#!/bin/bash

###############################################################################

# DESCRIPTION: Main script to manage installation and configuration after
#              fresh install of Ubuntu (18.04 LTS)
# AUTHOR:      Rabensteiner Alexander
# DATE:        04.11.2018

###############################################################################

# Enbale canonical third party repos
cd configUbuntu
bash ./enableRepos.sh
echo "CANONICAL PARTNER REPOS ENABLED."
cd ..

# Install extra packages
cd installPackages
sudo -H bash ./installPackages.sh
echo "INSTALLATION DONE."
cd ..

# Some system configurations
cd configUbuntu
bash ./configBash.sh
echo "BASH HAS BEEN CONFIGURED."
sudo bash ./configGnome.sh
echo "GNOME HAS BEEN CONFIGURED."
cd ..

# Configure firefox
cd configFirefox
bash ./configFirefox.sh
echo "FIREFOX HAS BEEN CONFIGURED."
cd ..

# Do some registration
# NOTE: registration script contains private data (it is not in my GitHub folder!)
cd registration
if [ -f ./registrations.sh ]; then
  bash ./registrations.sh
  echo "REGISTRATION WORK DONE."
else
  echo "WARNING: No registration script given!"
fi
cd ..
