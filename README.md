# Appium System Tools
A collection of shell scripts for Android Emulator and iOS Simulator instalation just for MAC os (Darwin) atm.

## Prerequisites
For any script:
1. Ensure Xcode is installed on your macOS system.
2. Ensure xcrun is available (it comes with Xcode).
3. Provide executable permissions to the script:
```sh
chmod +x <script_name>.sh
```

## Android
### androidEmulatorInstall.sh
This script is designed to automate the setup of an Android Virtual Device (AVD) on a machine. It installs the necessary system image and platform, and then creates an AVD with the specified name and device type.

#### Usage
```sh
./androidEmulatorInstall.sh <system_image> <platform> <avd_name> <device_name>
```
Arguments
- system_image: The system image to be installed. Example: system-images;android-30;google_apis;x86_64
- platform: The platform to be installed. Example: platforms;android-30
- avd_name: The name of the AVD to be created. Example: MyAVD
- device_name: The name of the device type. Example: pixel
- 
Example
```sh
./androidEmulatorInstall.sh "system-images;android-30;google_apis;x86_64" "platforms;android-30" "MyAVD" "pixel"
```

### androidEmulatorWizard.sh
This script provides an interactive way to create and manage Android Virtual Devices (AVDs). It allows users to install necessary system images and platforms, create new AVDs, list available AVDs, and start an AVD.
#### Usage
```sh
./androidEmulatorWizard.sh
```

### androidEnvInstall.sh
This script automates the setup of the Android SDK, including command-line tools, emulator, and platform tools. It checks if the required components are installed and installs them if they are missing.
#### Prerequisites
1. Ensure your system has curl and unzip installed.
2. Provide executable permissions to the script:
```sh
chmod +x <script_name>.sh
```
#### Usage
Run the script without any arguments:
```sh
./androidEnvInstall.sh
```

## iOS

### iosEnvInstall.sh
This script checks if Xcode is installed on your macOS system. If not, it prompts the user to install Xcode manually. If Xcode is installed, it sets it as the default developer directory and performs the initial setup required for Xcode.

### iosSimulatorInstall.sh
This script automates the creation of a new iOS Simulator device using xcrun simctl and then opens the iOS Simulator app.
#### Usage
```sh
./iosSimulatorInstall.sh <runtime> <deviceType> <name>
```
Arguments:
1. runtime: The iOS runtime for the simulator. Example: com.apple.CoreSimulator.SimRuntime.iOS-14-4
2. deviceType: The device type for the simulator. Example: com.apple.CoreSimulator.SimDeviceType.iPhone-12
3. name: The name for the new simulator device. Example: MyNewSimulator
```sh
./iosSimulatorInstall.sh "com.apple.CoreSimulator.SimRuntime.iOS-14-4" "com.apple.CoreSimulator.SimDeviceType.iPhone-12" "MyNewSimulator"
```

### iosSimulatorWizard.sh
This script allows users to either create a new iOS Simulator or boot an existing one. It provides an interactive prompt to guide the user through the process.
#### Usage
```sh
./iosSimulatorWizard.sh
```
### iosWdaInstall.sh
This script automates the setup and build process for the WebDriverAgent project using Xcode. It checks if the WebDriverAgent directory exists and if not, downloads and extracts the WebDriverAgent source code. It then builds and tests the WebDriverAgentRunner scheme on the specified iOS Simulator device.

### Usage
Run the script with the name of the iOS Simulator device as an argument:
```sh
./iosWdaInstall.sh <deviceName>
```
Example:
```sh
./iosWdaInstall.sh "iPhone 12"
```
