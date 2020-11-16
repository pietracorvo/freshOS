#!/bin/bash

###############################################################################

# DESCRIPTION: Configure some gnome settings
# AUTHOR:      Rabensteiner Alexander
# DATE:        04.11.2018

###############################################################################

# Add 'New Document' option to nautilus filemanager
touch ~/Templates/New\ Document

# Configure gnome desktop
gsettings set org.gnome.nautilus.desktop trash-icon-visible false
gsettings set org.gnome.nautilus.desktop home-icon-visible false
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.calendar show-weekdate true
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.sound event-sounds false # kill annoying alert sound
#gsettings set org.gnome.desktop.screensaver lock-enabled false # no lock after screensaver goes active
#gsettings set org.gnome.desktop.screensaver lock-delay 0 # no autolock after certain time

# Configure gedit
gsettings set org.gnome.gedit.preferences.editor display-right-margin true
gsettings set org.gnome.gedit.preferences.editor highlight-current-line true
gsettings set org.gnome.gedit.preferences.editor search-highlighting true
gsettings set org.gnome.gedit.preferences.editor bracket-matching true
gsettings set org.gnome.gedit.preferences.editor display-line-numbers true
gsettings set org.gnome.gedit.preferences.editor insert-spaces true
gsettings set org.gnome.gedit.preferences.editor tabs-size 4
gsettings set org.gnome.gedit.preferences.editor auto-indent true
gsettings set org.gnome.gedit.preferences.ui bottom-panel-visible true
gsettings set org.gnome.gedit.preferences.ui side-panel-visible false
gsettings set org.gnome.gedit.preferences.ui statusbar-visible true
gsettings set org.gnome.gedit.preferences.ui max-recents 10



# TODO: enable gnome-shell-extensions (like caffeine, openweather, etc.)
