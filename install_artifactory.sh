#!/bin/bash

# Update the system
echo "Updating the system..."
sudo apt update

# Install OpenJDK 8
echo "Installing OpenJDK 8..."
sudo apt install openjdk-8-jdk -y

# Download JFrog Artifactory OSS
ARTIFACTORY_VERSION="6.9.6"
echo "Downloading JFrog Artifactory OSS version $ARTIFACTORY_VERSION..."
sudo wget https://jfrog.bintray.com/artifactory/jfrog-artifactory-oss-$ARTIFACTORY_VERSION.zip -O /tmp/jfrog-artifactory-oss.zip

# Install Unzip if not already installed
echo "Installing unzip package..."
sudo apt install unzip -y

# Unzip the Artifactory package
echo "Unzipping the Artifactory package..."
sudo unzip -o /tmp/jfrog-artifactory-oss.zip -d /opt/

# Navigate to the Artifactory directory
echo "Navigating to the Artifactory directory..."
cd /opt/artifactory-oss-$ARTIFACTORY_VERSION || exit

# Start JFrog Artifactory service with sudo
echo "Starting JFrog Artifactory..."
sudo ./bin/artifactory.sh start

# Print the access URL
echo "JFrog Artifactory is up and running."
echo "You can access it at http://serverip:8081/artifactory"
