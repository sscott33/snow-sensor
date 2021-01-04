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

echo '#### Updating your installation sources ###############################'
echo
sudo apt update -y
echo

echo '#### Installing software for I2C ######################################'
echo
sudo apt install -y python3-pip i2c-tools python3-numpy python3-pillow python3-picamera python3-rpi.gpio
echo

sudo pip3 install adafruit-circuitpython-amg88xx adafruit-circuitpython-sht31d
echo

#echo '#### Use Python 3 by default ##########################################'
#sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 100
#echo

echo '#### Writing the test scripts and license file ########################'
echo
mkdir /home/pi/testing
cd /home/pi/testing

#### testing scripts and licenses ####

wget https://raw.githubusercontent.com/sscott33/snow-sensor/master/testing/test_amg88xx.py

wget https://raw.githubusercontent.com/sscott33/snow-sensor/master/testing/test_amg88xx_license.txt

wget https://raw.githubusercontent.com/sscott33/snow-sensor/master/testing/test_sht31.py

wget https://raw.githubusercontent.com/sscott33/snow-sensor/master/testing/test_sht31_license.txt

wget https://raw.githubusercontent.com/sscott33/snow-sensor/master/testing/test_raspi_camera.sh

#### postcomponent_1 ####
#### making python and shell scripts executable ####
chmod +x *.py *.sh

#### remind the user to enable I2C and to reboot ####
echo
echo Please enable I2C by running raspi-config and then reboot.
