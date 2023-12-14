#!/bin/bash

# Update package information and install dependencies
sudo apt-get update -y &&
sudo apt-get install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg-agent \
  software-properties-common &&

# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - &&

# Add Docker's repository to APT sources
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" &&

# Update package information again with the new Docker repository
sudo apt-get update -y &&

# Install Docker packages
sudo apt-get install docker-ce docker-ce-cli containerd.io -y &&

# Add the user 'ubuntu' to the 'docker' group for non-root Docker access
sudo usermod -aG docker ubuntu
