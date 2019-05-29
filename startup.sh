#!/bin/bash
# NHIP MVP v1 setup script
# Run this as root on a new machine
#
# Something going wrong? Pipe the output of this script through grep
# searching for "[Debug]" to see how far the script goes before failing

echo "[Debug] Add a user to run the containers"
useradd -m dockeruser

echo "[Debug] Adding the user to the docker group"
gpasswd -a dockeruser docker

echo "[Debug] Attempt to install packages"
apt-get install docker npm git -y

echo "[Debug] Switching user"
su -c "sh nopriv.sh" dockeruser
