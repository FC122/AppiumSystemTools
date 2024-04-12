#!/bin/bash

export ANDROID_HOME=$HOME/Library/Android/sdk

while true; do

    read -p "Do you want to create a new AVD? (yes/no): " create_new_avd

    if [ "$create_new_avd" = "yes" ]; then

            echo "Available platforms:"
            $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager --list
            wait $!

            read -p "Choose system image (e.g., system-images;android-32;google_apis;x86_64): " system_image
            read -p "Choose a platform (e.g., platforms;android-32): " platform

            echo "Installing platform $platform and system image $system_image..."
            yes | $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager --install $system_image &
            PID=$!
            wait $PID

            yes | $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager --install $platform &
            PID=$!
            wait $PID

            echo "Creating AVD..."
            read -p "Enter a name for your AVD: " avd_name

            $ANDROID_HOME/cmdline-tools/latest/bin/avdmanager list
            wait $!
            read -p "Enter a device (e.g., pixel_23a): " device_name

            yes | $ANDROID_HOME/cmdline-tools/latest/bin/avdmanager create avd -n "$avd_name" -k $system_image --device "$device_name" &
            PID=$!
            wait $PID
            echo "Creation completed with exit code $?"
            break
    else
        if [ ! -x "$ANDROID_HOME/emulator/emulator -list-avds" ]; then
            break
        else
            echo "No AVDs found."
            continue 
        fi
    fi
done

echo "Available AVDs:"
"$ANDROID_HOME/emulator/emulator" -list-avds
read -p "Choose an AVD: " avd_name

echo "Starting AVD $avd_name..."
$ANDROID_HOME/emulator/emulator -avd "$avd_name"
wait $!