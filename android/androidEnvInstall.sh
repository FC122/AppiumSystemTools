#!/bin/bash

export ANDROID_HOME=$HOME/Library/Android/sdk
#export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk

# Check if Android SDK is installed
if [ ! -d "$ANDROID_HOME" ]; then
    echo "Android SDK not found. Downloading and installing..."
    # Download Android SDK command-line tools
    mkdir -p $ANDROID_HOME
    cd $ANDROID_HOME
    #link from here https://developer.android.com/studio scroll to the bottom
    curl -o commandlinetools.zip https://dl.google.com/android/repository/commandlinetools-mac-6858069_latest.zip
    unzip -q commandlinetools.zip
    rm commandlinetools.zip
    cd cmdline-tools
    mkdir latest
    mv * latest/
fi

# Check if the emulator is already installed
if [ ! -x "$ANDROID_HOME/emulator/emulator" ]; then
    echo "Android Emulator not found. Installing..."
        $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager --install "emulator"
        wait $!
        echo "Android Emulator installed successfully."
else
    echo "Android Emulator is already installed."
fi

# Check if the emulator is already installed
if [ ! -x "$ANDROID_HOME/platform-tools" ]; then
    echo "Platform tools not found. Installing..."
        $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager --install "platform-tools"
        wait $!
        echo "Platfrom tools installed successfully."
else
    echo "Platform tools is already installed."
fi