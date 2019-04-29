#!/bin/bash

###############################################################################

# DESCRIPTION: Configure firefox (build custom profile, change settings, import bookmarks, add plugins)
# NOTE:        Execute after firefox has been installed.
# AUTHOR:      Rabensteiner Alexander
# DATE:        27.03.2019

###############################################################################

# -----------------------------------------------------
# Create a new firefox profile if it not already exists
# -----------------------------------------------------
NEW_PROFILE='localProfile' # name of new firefox profile
if [ ! -d ~/.mozilla/firefox/*.$NEW_PROFILE ]; then
    # Open and close firefox to make default user_pref
    firefox &
    sleep 3
    pkill firefox
    # Create new profile
    firefox -CreateProfile $NEW_PROFILE
    # And change new profile to default
    sed -i.bak 's/Default=1/Default=0/' ~/.mozilla/firefox/profiles.ini
    head -n -1 ~/.mozilla/firefox/profiles.ini >> tmp.ini; mv tmp.ini ~/.mozilla/firefox/profiles.ini # cut newlines out of profiles.ini
    echo -e 'Default=1\n' >> ~/.mozilla/firefox/profiles.ini
    # Open and close firefox again to build folders for new profile
    firefox &
    sleep 3
    pkill firefox
    echo "NOTE: New firefox profile ???.$NEW_PROFILE has been created."
else
    echo "NOTE: Firefox profile ???.$NEW_PROFILE already exists."
fi
# Get the local profile path (which is needed in the following methods)
PATH_TO_PROFILE=$(find ~/.mozilla/firefox -maxdepth 1 -type d -name "*.$NEW_PROFILE" -print -quit)

# ------------------------------------------------------------------------------
# Write prefered firefox settings to prefs.js (that is a change of firefoxes about:config)
# ------------------------------------------------------------------------------
# Loop over file containing settings
PATH_TO_SETTINGS='firefoxSettings.dat' # file containing my personal firefox settings
while read -r LINE; do
    # Skip loop when comment (line beginning with #) or empty
    [ "${LINE:0:1}" == "#" ] || [ "$LINE" = '' ] && continue
    # Extract name of firefox preference
    PREF_NAME=${LINE#*user_pref(}
    PREF_NAME=${PREF_NAME%%, *}
    # Only do something if prefs.js does not match my preference
    if ! grep -q "$LINE" "$PATH_TO_PROFILE/prefs.js"; then
        # If string containing preference name with wrong setting already exists in prefs.js, delete the line first
        if grep -q "$PREF_NAME" "$PATH_TO_PROFILE/prefs.js"; then
            sed -i "/${PREF_NAME}/d" "$PATH_TO_PROFILE/prefs.js"
            echo "$LINE" >> "$PATH_TO_PROFILE/prefs.js"
        else
            echo "$LINE" >> "$PATH_TO_PROFILE/prefs.js"
        fi
        echo "NOTE: I added the line $LINE to $PATH_TO_PROFILE/prefs.js ."
    fi
done < $PATH_TO_SETTINGS

# -------------------------------
# Copy bookmarks to local profile
# -------------------------------
# NOTE: This copies the bookmarks to the import default folder in the book mark menu. To finally import them to firefox, click 'import bookmarks' in the bookmark menu.
ALL_BOOKMARKS=$(find firefoxBookmarks -name 'bookmarks-*-*-*.json' | sort)
LATEST_BOOKMARK=${ALL_BOOKMARKS##*$'\n'}
INFO=$(cp -v $LATEST_BOOKMARK $PATH_TO_PROFILE/bookmarkbackups/$(basename $LATEST_BOOKMARK))
echo "NOTE: I have done this copy for the bookmarks: $INFO"

# -------------------------------------------------
# Copy plugins from source to local firefox profile
# -------------------------------------------------
PATH_TO_PLUGINS='firefoxPlugins' # folder containing my personal firefox plugins
INFO=$(cp -Ruv $PATH_TO_PLUGINS/. $PATH_TO_PROFILE/extensions)
echo "NOTE: I have done this copy for the firefox plugins: $INFO"

# Kill if any running firefox processes remain ...
pkill firefox

