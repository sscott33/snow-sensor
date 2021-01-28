#!/bin/bash

# Copyright 2021 Samuel Odell Scott

# I2C addresses for the sensors of interest
    # addr 44 is the SHT31 temperature and humidity sensor
    # addr 69 is the AMG8833 8x8 IR array
thSensor=44
irSensor=69

# error handling
Error() {
    echo Error: missing dependency. Please run \"sudo apt install i2c-tools\" to correct the issue.
    exit 0
}

# check for i2cdetect
[ -f /usr/sbin/i2cdetect ] || Error

# get the list of I2C devices connected to the Pi
i2cAddrList=$(/usr/sbin/i2cdetect -y 1)

# report which of the devices of interest are detected
grep -q $irSensor <<< $i2cAddrList && echo The AMG8833 is connected. || echo The AMG8833 was not detected.
grep -q $thSensor <<< $i2cAddrList && echo The SHT31 is connected. || echo The SHT31 was not detected.
