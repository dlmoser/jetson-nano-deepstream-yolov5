#!/bin/bash

# Extract client IP using awk
client_ip=$(echo "$SSH_CLIENT" | awk '{print $1}')

# Export the IP address as an environment variable
export DISPLAY="$client_ip":0

# Check if CLIENT_IP is set after export
echo "DISPLAY is now set to: $DISPLAY"