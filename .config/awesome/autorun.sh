#!/usr/bin/env bash

if (xrdb -query | grep -q "^awesome\\.started:\\s*true$");
    then exit;
fi

# Make sure autorun happens only once
xrdb -merge <<< "awesome.started:true";

# Start general applications
picom&

# Start everything else
dex --environment Awesome --autostart
