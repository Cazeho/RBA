#!/bin/bash

# Set the URL for the latest version of ngrok
NGROK_URL="https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip"

# Download ngrok
echo "Downloading ngrok..."
wget $NGROK_URL -O ngrok.zip

# Unzip the downloaded file
echo "Unzipping ngrok..."
unzip ngrok.zip

# Move ngrok to /usr/local/bin for global access
echo "Installing ngrok..."
sudo mv ngrok /usr/local/bin

# Clean up the downloaded zip file
echo "Cleaning up..."
rm ngrok.zip

# Verify the installation
echo "Verifying ngrok installation..."
if command -v ngrok &> /dev/null
then
    echo "ngrok successfully installed"
else
    echo "ngrok installation failed"
    exit 1
fi

# Instructions for setting up authentication token
echo "1. Go to https://ngrok.com/ and sign up for a free account or log in if you already have one."
