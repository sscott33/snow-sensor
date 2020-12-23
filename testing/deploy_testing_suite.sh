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
sudo apt update -y && sudo apt upgrade -y
echo

echo '#### Installing software for I2C ######################################'
echo
sudo apt install -y python3-pip i2c-tools
echo

sudo pip3 install adafruit-circuitpython-amg88xx adafruit-circuitpython-sht31d
echo

echo '#### Use Python 3 by default ##########################################'
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 100
echo

echo '#### Writing the test scripts and license file ########################'
echo
mkdir /home/pi/testing
cd /home/pi/testing

#### testing scripts and licenses ####

base64 -di test_amg88xx.py > test_amg88xx.py <<'EOF'
IyEvdXNyL2Jpbi9lbnYgcHl0aG9uMwoKaW1wb3J0IHRpbWUKaW1wb3J0IGJ1c2lvCmltcG9ydCBi
b2FyZAppbXBvcnQgYWRhZnJ1aXRfYW1nODh4eAoKaTJjID0gYnVzaW8uSTJDKGJvYXJkLlNDTCwg
Ym9hcmQuU0RBKQphbWcgPSBhZGFmcnVpdF9hbWc4OHh4LkFNRzg4WFgoaTJjKQoKd2hpbGUgVHJ1
ZToKICAgIGZvciByb3cgaW4gYW1nLnBpeGVsczoKICAgICAgICBwcmludChbJ3swOi4xZn0nLmZv
cm1hdCh0ZW1wKSBmb3IgdGVtcCBpbiByb3ddKQogICAgICAgIHByaW50KCIiKQoKICAgIHByaW50
KCJcbiIpCg==
EOF

base64 -di test_amg88xx_license.txt > test_amg88xx_license.txt <<'EOF'
VGhlIE1JVCBMaWNlbnNlIChNSVQpCgpDb3B5cmlnaHQgKGMpIDIwMTcgRGVhbiBNaWxsZXIsIHdy
aXR0ZW4gZm9yIEFkYWZydWl0IEluZHVzdHJpZXMKClBlcm1pc3Npb24gaXMgaGVyZWJ5IGdyYW50
ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBhbnkgcGVyc29uIG9idGFpbmluZyBhIGNvcHkKb2YgdGhp
cyBzb2Z0d2FyZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUgIlNvZnR3
YXJlIiksIHRvIGRlYWwKaW4gdGhlIFNvZnR3YXJlIHdpdGhvdXQgcmVzdHJpY3Rpb24sIGluY2x1
ZGluZyB3aXRob3V0IGxpbWl0YXRpb24gdGhlIHJpZ2h0cwp0byB1c2UsIGNvcHksIG1vZGlmeSwg
bWVyZ2UsIHB1Ymxpc2gsIGRpc3RyaWJ1dGUsIHN1YmxpY2Vuc2UsIGFuZC9vciBzZWxsCmNvcGll
cyBvZiB0aGUgU29mdHdhcmUsIGFuZCB0byBwZXJtaXQgcGVyc29ucyB0byB3aG9tIHRoZSBTb2Z0
d2FyZSBpcwpmdXJuaXNoZWQgdG8gZG8gc28sIHN1YmplY3QgdG8gdGhlIGZvbGxvd2luZyBjb25k
aXRpb25zOgoKVGhlIGFib3ZlIGNvcHlyaWdodCBub3RpY2UgYW5kIHRoaXMgcGVybWlzc2lvbiBu
b3RpY2Ugc2hhbGwgYmUgaW5jbHVkZWQgaW4gYWxsCmNvcGllcyBvciBzdWJzdGFudGlhbCBwb3J0
aW9ucyBvZiB0aGUgU29mdHdhcmUuCgpUSEUgU09GVFdBUkUgSVMgUFJPVklERUQgIkFTIElTIiwg
V0lUSE9VVCBXQVJSQU5UWSBPRiBBTlkgS0lORCwgRVhQUkVTUyBPUgpJTVBMSUVELCBJTkNMVURJ
TkcgQlVUIE5PVCBMSU1JVEVEIFRPIFRIRSBXQVJSQU5USUVTIE9GIE1FUkNIQU5UQUJJTElUWSwK
RklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UgQU5EIE5PTklORlJJTkdFTUVOVC4gSU4g
Tk8gRVZFTlQgU0hBTEwgVEhFCkFVVEhPUlMgT1IgQ09QWVJJR0hUIEhPTERFUlMgQkUgTElBQkxF
IEZPUiBBTlkgQ0xBSU0sIERBTUFHRVMgT1IgT1RIRVIKTElBQklMSVRZLCBXSEVUSEVSIElOIEFO
IEFDVElPTiBPRiBDT05UUkFDVCwgVE9SVCBPUiBPVEhFUldJU0UsIEFSSVNJTkcgRlJPTSwKT1VU
IE9GIE9SIElOIENPTk5FQ1RJT04gV0lUSCBUSEUgU09GVFdBUkUgT1IgVEhFIFVTRSBPUiBPVEhF
UiBERUFMSU5HUyBJTiBUSEUKU09GVFdBUkUu
EOF

base64 -di test_sht31.py > test_sht31.py <<'EOF'
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

base64 -di test_sht31_license.txt > test_sht31_license.txt <<'EOF'
VGhlIE1JVCBMaWNlbnNlIChNSVQpCgpDb3B5cmlnaHQgKGMpIDIwMTcgSmVycnkgTmVlZGVsbAoK
UGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJz
b24gb2J0YWluaW5nIGEgY29weQpvZiB0aGlzIHNvZnR3YXJlIGFuZCBhc3NvY2lhdGVkIGRvY3Vt
ZW50YXRpb24gZmlsZXMgKHRoZSAiU29mdHdhcmUiKSwgdG8gZGVhbAppbiB0aGUgU29mdHdhcmUg
d2l0aG91dCByZXN0cmljdGlvbiwgaW5jbHVkaW5nIHdpdGhvdXQgbGltaXRhdGlvbiB0aGUgcmln
aHRzCnRvIHVzZSwgY29weSwgbW9kaWZ5LCBtZXJnZSwgcHVibGlzaCwgZGlzdHJpYnV0ZSwgc3Vi
bGljZW5zZSwgYW5kL29yIHNlbGwKY29waWVzIG9mIHRoZSBTb2Z0d2FyZSwgYW5kIHRvIHBlcm1p
dCBwZXJzb25zIHRvIHdob20gdGhlIFNvZnR3YXJlIGlzCmZ1cm5pc2hlZCB0byBkbyBzbywgc3Vi
amVjdCB0byB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnM6CgpUaGUgYWJvdmUgY29weXJpZ2h0IG5v
dGljZSBhbmQgdGhpcyBwZXJtaXNzaW9uIG5vdGljZSBzaGFsbCBiZSBpbmNsdWRlZCBpbiBhbGwK
Y29waWVzIG9yIHN1YnN0YW50aWFsIHBvcnRpb25zIG9mIHRoZSBTb2Z0d2FyZS4KClRIRSBTT0ZU
V0FSRSBJUyBQUk9WSURFRCAiQVMgSVMiLCBXSVRIT1VUIFdBUlJBTlRZIE9GIEFOWSBLSU5ELCBF
WFBSRVNTIE9SCklNUExJRUQsIElOQ0xVRElORyBCVVQgTk9UIExJTUlURUQgVE8gVEhFIFdBUlJB
TlRJRVMgT0YgTUVSQ0hBTlRBQklMSVRZLApGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9T
RSBBTkQgTk9OSU5GUklOR0VNRU5ULiBJTiBOTyBFVkVOVCBTSEFMTCBUSEUKQVVUSE9SUyBPUiBD
T1BZUklHSFQgSE9MREVSUyBCRSBMSUFCTEUgRk9SIEFOWSBDTEFJTSwgREFNQUdFUyBPUiBPVEhF
UgpMSUFCSUxJVFksIFdIRVRIRVIgSU4gQU4gQUNUSU9OIE9GIENPTlRSQUNULCBUT1JUIE9SIE9U
SEVSV0lTRSwgQVJJU0lORyBGUk9NLApPVVQgT0YgT1IgSU4gQ09OTkVDVElPTiBXSVRIIFRIRSBT
T0ZUV0FSRSBPUiBUSEUgVVNFIE9SIE9USEVSIERFQUxJTkdTIElOIFRIRQpTT0ZUV0FSRS4K
EOF

base64 -di test_raspi_camera.sh > test_raspi_camera.sh <<'EOF'
IyEvYmluL2Jhc2gKCnJhc3Bpc3RpbGwgLW8gdGVzdENhcHR1cmUuanBnIC1zdCAtdCAxMDAwCg==
EOF

#### postcomponent_1 ####
#### making python and shell scripts executable ####
chmod +x *.py *.sh

#### remind the user to enable I2C and to reboot ####
echo
echo Please enable I2C by running raspi-config and then reboot.
