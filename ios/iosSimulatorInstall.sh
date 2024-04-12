#!/bin/bash

runtime="$1"
deviceType="$2"
name="$3"    

xcrun simctl create "$name" "$deviceType" "$runtime"
wait $!

open -a Simulator