#!/bin/bash

echo This script will install the necessary software to test the wiring of
echo the I2C sensors. Test scripts will be written to the
echo '/home/pi/testing' directory.
sleep 12

echo '#### Updating your installation ############################'
echo
sudo apt update -y && sudo apt upgrade -y
echo

echo '#### Installing software for I2C ###########################'
echo
sudo apt install -y python3-pip i2c-tools
echo

sudo pip3 install adafruit-circuitpython-amg88xx adafruit-circuitpython-sht31d
echo

echo '#### Writing the test scripts ##############################'
echo
mkdir /home/pi/testing
cd /home/pi/testing

base64 -di > test_sht31.py <<'EOF'
IyEvdXNyL2Jpbi9lbnYgcHl0aG9uMwoKaW1wb3J0IHRpbWUKaW1wb3J0IGJvYXJkCmltcG9ydCBi
dXNpbwppbXBvcnQgYWRhZnJ1aXRfc2h0MzFkCgojIENyZWF0ZSBsaWJyYXJ5IG9iamVjdCB1c2lu
ZyBvdXIgQnVzIEkyQyBwb3J0CmkyYyA9IGJ1c2lvLkkyQyhib2FyZC5TQ0wsIGJvYXJkLlNEQSkK
c2Vuc29yID0gYWRhZnJ1aXRfc2h0MzFkLlNIVDMxRChpMmMpCgpsb29wY291bnQgPSAwCndoaWxl
IFRydWU6CiAgICBwcmludCgiXG5UZW1wZXJhdHVyZTogJTAuMWYgQyIgJSBzZW5zb3IudGVtcGVy
YXR1cmUpCiAgICBwcmludCgiSHVtaWRpdHk6ICUwLjFmICUlIiAlIHNlbnNvci5yZWxhdGl2ZV9o
dW1pZGl0eSkKICAgIGxvb3Bjb3VudCArPSAxCiAgICB0aW1lLnNsZWVwKDIpCiAgICAjIGV2ZXJ5
IDEwIHBhc3NlcyB0dXJuIG9uIHRoZSBoZWF0ZXIgZm9yIDEgc2Vjb25kCiAgICBpZiBsb29wY291
bnQgPT0gMTA6CiAgICAgICAgbG9vcGNvdW50ID0gMAogICAgICAgIHNlbnNvci5oZWF0ZXIgPSBU
cnVlCiAgICAgICAgcHJpbnQoIlNlbnNvciBIZWF0ZXIgc3RhdHVzID0iLCBzZW5zb3IuaGVhdGVy
KQogICAgICAgIHRpbWUuc2xlZXAoMSkKICAgICAgICBzZW5zb3IuaGVhdGVyID0gRmFsc2UKICAg
ICAgICBwcmludCgiU2Vuc29yIEhlYXRlciBzdGF0dXMgPSIsIHNlbnNvci5oZWF0ZXIpCg==
EOF
chmod +x test_sht31.py

base64 -di > test_amg33xx.py <<'EOF'
IyEvdXNyL2Jpbi9lbnYgcHl0aG9uMwoKaW1wb3J0IHRpbWUKaW1wb3J0IGJ1c2lvCmltcG9ydCBi
b2FyZAppbXBvcnQgYWRhZnJ1aXRfYW1nODh4eAoKaTJjID0gYnVzaW8uSTJDKGJvYXJkLlNDTCwg
Ym9hcmQuU0RBKQphbWcgPSBhZGFmcnVpdF9hbWc4OHh4LkFNRzg4WFgoaTJjKQoKd2hpbGUgVHJ1
ZToKICAgIGZvciByb3cgaW4gYW1nLnBpeGVsczoKICAgICAgICBwcmludChbJ3swOi4xZn0nLmZv
cm1hdCh0ZW1wKSBmb3IgdGVtcCBpbiByb3ddKQogICAgICAgIHByaW50KCIiKQoKICAgIHByaW50
KCJcbiIpCiAgICB0aW1lLnNsZWVwKDEpCg==
EOF
chmod +x test_amg33xx.py

echo
echo Please enable I2C by running raspi-config and then reboot.
