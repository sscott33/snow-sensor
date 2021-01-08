#!/bin/bash

#### precomponent_1 ####
cat <<'EOF'
#### NOTICE ###########################################################
This script will install the necessary software to test the wiring of
the I2C sensors and a pi-compatible camera. Test scripts will be
written to the /home/pi/testing directory. Please note that this
testing suite makes use of free licensed open source software. Please
see the licensing files (*_license.txt) for details.
#######################################################################
EOF
sleep 25
echo

echo '#### Updating your installation #######################################'
echo
apt update -y && apt upgrade -y
echo

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

curl -OsS https://raw.githubusercontent.com/sscott33/snow-sensor/master/testing/test_amg88xx.py

curl -OsS https://raw.githubusercontent.com/sscott33/snow-sensor/master/testing/test_amg88xx_license.txt

curl -OsS https://raw.githubusercontent.com/sscott33/snow-sensor/master/testing/test_sht31.py

curl -OsS https://raw.githubusercontent.com/sscott33/snow-sensor/master/testing/test_sht31_license.txt

curl -OsS https://raw.githubusercontent.com/sscott33/snow-sensor/master/testing/test_raspi_camera.sh

curl -OsS https://raw.githubusercontent.com/sscott33/snow-sensor/master/testing/test_i2c_connections.sh

#### postcomponent_1 ####
#### making python and shell scripts executable ####
chmod +x *.py *.sh

#### give ownership of new files to the pi user ####
chown -R pi:pi /home/pi/testing

#### remind the user to enable I2C and to reboot ####
echo
echo Please enable I2C by running raspi-config and then reboot.
