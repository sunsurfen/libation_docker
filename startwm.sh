#!/bin/bash
/usr/bin/pulseaudio --start


# Need to have a UTF-8 friendly LANG set.

export LANG=en_US.UTF-8
export oa_external=false
export oa_packaging=docker


FILE=/usr/bin/libation
if [ -f "$FILE" ]; then
    echo "$FILE exists."
    libation &
else 
    echo "$FILE does not exist. Installing version 11.1"
    mkdir -p /config/Desktop
    xfce4-terminal --command /config/setup.sh &
fi


# create desktop shortcut 
mkdir -p /config/Desktop

# This blocks until user closes session
/usr/bin/startxfce4 > /dev/null 2>&1

