#!/bin/bash

###############################################################################

# DESCRIPTION: Enable canonical partner software and sourcecode
# AUTHOR:      Rabensteiner Alexander
# DATE:        04.11.2018

###############################################################################

# Location of canoncial repository list
SOURCE_LIST='/etc/apt/sources.list'

# If no backup exists make one
if ! [ -f "$SOURCE_LIST.bckp" ]; then
    cp $SOURCE_LIST "$SOURCE_LIST.bckp"
fi

# Enable canonical partner repos
if $(grep -xq '^# deb .*partner' $SOURCE_LIST); then
    sed -i '/^# deb .*partner/ s/^# //' $SOURCE_LIST
    echo 'Canonical partner repos changed to enabled.'
elif $(grep -xq '^deb .*partner' $SOURCE_LIST); then
    echo 'Canonical partner repos already enabled.'
else
    echo 'ERROR: No third party software repos found in $SOURCE_LIST.'
fi

# Enable canonical partner sourcecode repos
if $(grep -xq '^# deb-src .*partner' $SOURCE_LIST); then
    sed -i '/^# deb-src .*partner/ s/^# //' $SOURCE_LIST
    echo 'Canonical partner sourcecode repos changed to enabled.'
elif $(grep -xq '^deb .*partner' $SOURCE_LIST); then
    echo 'Canonical partner sourcecode repos already enabled.'
else
    echo 'ERROR: No third party software sourcecode repos found in $SOURCE_LIST.'
fi

