#!/bin/sh
# Use this install docker config on Ubuntu and debian based OS-es
##############################################################################
sudo apt-get update -y
  
# Install Docker's package dependencies.
sudo apt-get install -y \
        apt-transport-https \
            ca-certificates \
                curl \
                    software-properties-common

# Download and add Docker's official public PGP key.
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Verify the fingerprint.
sudo apt-key fingerprint 0EBFCD88

# Add the `stable` channel's Docker upstream repository.
#
# If you want to live on the edge, you can change "stable" below to "test" or
# "nightly". I highly recommend sticking with stable!
sudo add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
          $(lsb_release -cs) \
             stable"

# Update the apt package list (for the new apt repo).
sudo apt-get update -y

# Install the latest version of Docker CE.
sudo apt-get install -y docker-ce

# Allow your user to access the Docker CLI without needing root access
sudo usermod -aG docker $USER

# Install Python and PIP.
sudo apt-get install -y python python-pip

# Install Docker Compose into your user's home directory.
pip install --user docker-compose

# You should get a bunch of output about your Docker daemon.
# If you get a permission denied error, close + open your terminal and try again.
docker info

# You should get back your Docker Compose version.
docker-compose --version
