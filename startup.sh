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

echo "[Debug] Clone the repo in the home directory"
cd ~
git clone "https://github.com/mrlopez116/Docker-React-Mongo-Node.git"

echo "[Debug] Move into the repo directory"
cd "Docker-React-Mongo-Node"

echo "[Debug] Run NPM install on the dependencies for the client"
cd client/
npm install
cd ../

echo "[Debug] Running NPM install on the dependencies for the API.."
cd api/
npm install
cd ../

echo "[Debug] Praying..."
docker-compose up
