#!/bin/bash

deviceName="$1"

if [ -d "wda" ]; then
    cd wda
    cd WebDriverAgent-7.1.2
    xcodebuild -project WebDriverAgent.xcodeproj \
            -scheme WebDriverAgentRunner \
            -destination "platform=iOS Simulator,name=$deviceName" \
            test
else
    mkdir wda
    cd wda
    #link from here https://github.com/appium/WebDriverAgent/releases Source code.zip file
    curl -L -k -o wda.zip -v https://github.com/appium/WebDriverAgent/archive/refs/tags/v7.1.2.zip
    unzip -q wda.zip
    rm wda.zip
    cd WebDriverAgent-7.1.2
    xcodebuild -project WebDriverAgent.xcodeproj \
            -scheme WebDriverAgentRunner \
            -destination "platform=iOS Simulator,name=$deviceName" \
            test
fi