#!/bin/bash

export ANDROID_HOME=$HOME/Library/Android/sdk

system_image="$1"
platform="$2"
avd_name="$3"
device_name="$4"
echo "System Image: $system_image"
echo "Platform: $platform"
echo "AVD Name: $avd_name"
echo "Device: $device_name"

export ANDROID_HOME=$HOME/Library/Android/sdk

$ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager --install $system_image 
wait $!

$ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager --install $platform &
wait $!

$ANDROID_HOME/cmdline-tools/latest/bin/avdmanager create avd -n "$avd_name" -k $system_image --device "$device_name" &
wait $!
echo "Device created"