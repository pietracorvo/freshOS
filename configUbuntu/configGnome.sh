#!/bin/bash

###############################################################################

# DESCRIPTION: Configure some gnome settings
# AUTHOR:      Rabensteiner Alexander
# DATE:        04.11.2018

###############################################################################

# Add 'New Document' option to nautilus filemanager
touch ~/Templates/New\ Document

# Kill annoying terminal beep (this needs sudo rights!)
sed -i.bak 's/^# set bell-style none/set bell-style none/' /etc/inputrc

# Configure gnome desktop
gsettings set org.gnome.desktop.sound event-sounds false # kill annoying alert sound
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface show-battery-percentage true
# NOTE: here is something wrong, i want ubuntu to never auto lock my screen ... 
gsettings set org.gnome.desktop.screensaver lock-enabled true # enable screenlock (just when closing lid)
gsettings set org.gnome.desktop.screensaver lock-delay 0 # no autolock after certain time
gsettings set org.gnome.desktop.screensaver logout-delay 0 # no autologout after certain time # I think logout is deprecated ...

# Configure gedit
gsettings set org.gnome.gedit.preferences.editor display-right-margin true
gsettings set org.gnome.gedit.preferences.editor highlight-current-line true
gsettings set org.gnome.gedit.preferences.editor bracket-matching true
gsettings set org.gnome.gedit.preferences.editor display-line-numbers true
gsettings set org.gnome.gedit.preferences.editor insert-spaces true
gsettings set org.gnome.gedit.preferences.editor tabs-size uint32\ 4
gsettings set org.gnome.gedit.preferences.ui bottom-panel-visible true
gsettings set org.gnome.gedit.preferences.ui side-panel-visible false
gsettings set org.gnome.gedit.preferences.ui statusbar-visible true

