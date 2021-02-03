#!/bin/bash

# Copyright 2021 Samuel Odell Scott

if [ "$(id -u)" != "0" ]; then
    echo "You must use sudo to run this script" >&2
    exit 1
fi

trap 'exit 0' INT

cat <<'EOF'
#### NOTICE ###################################################################
This script will install the necessary software to test the wiring of the I2C
sensors and a pi-compatible camera. Test scripts will be written to the
/home/pi/testing directory. Please note that some files in this testing suite
are free licensed open source software. Please see the respective licensing
files (*_license.txt) for details.
###############################################################################
EOF
echo
read -p "Press ENTER when ready."

# message for prompt
IFS= read -r -d '' prompt << 'EOF'
What would you like the installer to do? (you have 30 sec to choose)

    1. Do full update of system and install testing suite.
    2. Install testing suite.
    3. Full update of system.
    4. Exit.

(default = 1)
EOF

function DoPrompt {

    clear

    IFS= read -r -t 30 -p "$prompt" answer || FullInstall

    case $answer in
        1) FullInstall;;
        2) InstallTestingSuite;;
        3) Update;;
        4) exit 0;;
        *) DoPrompt;;
    esac
}

function FullInstall {
    Update
    InstallTestingSuite
    exit 0
}

function Update() {
    echo '#### Updating your installation #######################################'
    echo
    apt update && apt -y upgrade
    echo
}

function InstallTestingSuite {
    echo '#### Installing necessary software ####################################'
    echo
    apt install -y python3-pip i2c-tools python3-numpy python3-pillow python3-picamera python3-rpi.gpio
    echo

    pip3 install adafruit-circuitpython-amg88xx adafruit-circuitpython-sht31d
    echo

    echo '#### Writing the test scripts and license files #######################'
    echo
    [ -d /home/pi/testing ] && rm -rf /home/pi/testing/* || mkdir /home/pi/testing
    cd /home/pi/testing

    #### testing scripts and licenses ####
    testDirURL="https://raw.githubusercontent.com/sscott33/snow-sensor/master/testing"
    curl -sS $testDirURL/testing_files | \
    while IFS="" read -r line
    do
        [ -n "$line" ] && curl -OsS $testDirURL/$line
    done

    #### making python and shell scripts executable ####
    chmod +x *.py *.sh

    #### give ownership of new files to the pi user ####
    chown -R pi:pi /home/pi/testing

    #### enable I2C ####
    echo
    echo '#### Enabling I2C #####################################################'
    sed -i '/dtparam=i2c_arm=off/s/off/on/1' /boot/config.txt
    sed -i '/#dtparam=i2c_arm/s/#//1' /boot/config.txt

    #### remind the user to reboot ####
    echo
    echo Please reboot your Pi for all changes to take effect.
}

DoPrompt
