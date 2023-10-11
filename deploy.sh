#!/bin/bash

# Update before installation
# Openjdk-jre installs Java required for Jenkins
# The -y option, as before, automatically confirms any prompts during installation.
sudo apt update && sudo apt install -y openjdk-11-jre

# Import the Jenkins GPG key
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

# Add the Jenkins repository to sources.list.d
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update the package repository
sudo apt-get update

# Install required packages
sudo apt-get install -y fontconfig openjdk-17-jre
sudo apt-get install -y jenkins


exit 0

