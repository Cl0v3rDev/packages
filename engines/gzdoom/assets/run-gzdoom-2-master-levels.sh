#!/bin/bash

if [ ! -f doom_complete.pk3 ]; then
    cd wadsmoosh-branch-default
    cp -rfv ../wadsmoosh.py ./

    cp -rfv ../masterbase/master/wads/*.WAD "source_wads/"
    cp -rfv ../base/*.WAD "source_wads/"
    python3.7 wadsmoosh.py
    cp -rfv ./doom_complete.pk3 ../

    cd ../
fi

if [ ! -f ~/.config/gzdoom/gzdoom.ini ]; then
    if [ ! -d ~/.config/gzdoom ]; then
        mkdir -p ~/.config/gzdoom
    fi
    cp -rfv ./gzdoom_template.ini ~/.config/gzdoom/gzdoom.ini
fi

LD_LIBRARY_PATH="lib:$LD_LIBRARY_PATH" ./gzdoom "$@"
