#!/bin/bash

if [! -d "$HOME/Aplications/Xcode.app"]; then
    echo "Please install Xcode manualy"
else
    break
fi
xcode-select -s $HOME/Applications/Xcode.app
wait $!
xcodebuild -runFirstLaunch
wait $!