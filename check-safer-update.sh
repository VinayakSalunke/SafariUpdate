#!/bin/bash

#### Safari Update script By Vinayak Salunke ######
#### https://github.com/VinayakSalunke #####

# Check for macOS version compatibility
if [[ $(sw_vers -productVersion) < 11.0 ]]; then
  echo "Error: Safari updates are not available separately for macOS versions earlier than 11.0 (Big Sur)."
  exit 1
fi

# Check for available Safari updates
available_updates=$(softwareupdate -l -a | grep -i "Safari")

if [[ -z "$available_updates" ]]; then
  echo "No Safari updates are available."
  exit 0
fi

# Get the latest Safari update label
latest_safari_update=$(echo "$available_updates" | tail -n 1 | awk '{print $1}')

# Install the latest Safari update
softwareupdate -i "$latest_safari_update"

# Check installation status
if [[ $? -eq 0 ]]; then
  echo "Safari update installed successfully!"
else
  echo "Error: Failed to install Safari update."
  exit 1
fi
