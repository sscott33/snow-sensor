# About
This repo is intended to contain all of the code for the snow sensor senior
design project. The 'testing' directory primarily contains software to test
sensor connections and functionality. It also contains some initial setup
automation. The file 'testing/deploy_testing_suite.sh' is designed to setup and
install all the software needed for testing and is designed to be run on a Pi
Zero or Zero W with an internet connection. If run with the default options, it
will fully prepare the Pi for initial testing of the sensors and their wiring.

Please note that this repo contains some software that is free licensed open
source (FLOSS). Each piece of FLOSS has its own licensing file, so see those
for more details.

# Deployment of the Testing Suite
To install the testing suite, please run the following three lines on your Pi
Zero or Pi Zero W with an internet connection:
```
curl -OsS https://raw.githubusercontent.com/sscott33/snow-sensor/master/testing/deploy_testing_suite.sh
chmod +x deploy_testing_suite.sh
sudo ./deploy_testing_suite.sh
```
Note that the testing suite installer is intended to be run on a fresh install
of Raspberry Pi OS. Similar deployment files may be created in the future for
updating the software of the snow sensors. Also note that one should not run a
bash script without first looking at the contents of the script. Only run
scripts without reading them if you explicitly trust the source.
