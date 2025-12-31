#!/bin/bash
set -e
set -u

# sudo -E $0 to pass env to su

# fake MAC address
#echo "export SECMAC=78:4f:43:9c:53:b3" >> .zprofile

# wifi interface
AIRPHY=en0

# Turn wifi toggle off in system settings/Wifi first
sudo networksetup -setairportpower $AIRPHY off
sleep 2

# change mac addr
sudo networksetup -setairportpower $AIRPHY on
sudo ifconfig $AIRPHY ether $SECMAC
sudo networksetup -detectnewhardware

echo $AIRPHY mac addr changed to $SECMAC ...
