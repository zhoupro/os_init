#!/usr/bin/env bash
function android(){

    if [ ! -d /opt/soft/dev/android-studio ] ;then
        sudo -u prozhou python3.5  $current_dir/function/lib/androidstudio.py
        unzip android.zip
        mv android-studio /opt/soft/dev/android-studio
        rm -f android.zip
    fi
}