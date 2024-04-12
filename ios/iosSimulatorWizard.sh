#!/bin/bash

read -p "Do you want to create a new Simulator or boot a current one (yes/no): " create_new_sim
if [ "$create_new_sim" = "yes" ]; then
    echo "Available runtimes:"
    xcrun simctl list runtimes
    wait $!
    read -p "Choose a runtime (e.g., com.apple.CoreSimulator.SimRuntime.iOS-17-0): " runtime

    echo "Available devices:"
    xcrun simctl list devicetypes
    wait $!
    read -p "Choose a device type (e.g., com.apple.CoreSimulator.SimDeviceType.iPhone-12-Pro-Max): " deviceType

    echo "Enter the name :"
    read -p "Choose a device type (e.g., com.apple.CoreSimulator.SimDeviceType.iPhone-12-Pro-Max): " name

    echo Creating simulator
    simctl create $name $deviceType $runtime
    wait $!
    echo "Creation completed with exit code"
fi

xcrun simctl list -v devices
wait $!

read -p "Chose a device by id (ID, e.g. ):" deviceId
wait $!

xcrun simctl boot $deviceId
wait $!

open -a Simulator