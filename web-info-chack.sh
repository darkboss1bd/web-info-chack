#!/bin/bash

# Function to display the banner
display_banner() {
    cat << "EOF"
 _____ _                 _
|_   _| |               | |
  | | | |__   __ _ _ __ | | __
  | | | '_ \ / _` | '_ \| |/ /
 _| |_| | | | (_| | | | |   <
|_____|_| |_|\__,_|_| |_|_|\_\

darkboss1bd
EOF
}

# Function to display the hacker animation
hacker_animation() {
    local delay=0.1 # delay between frames
    local frames=("|" "/" "-" "\\")

    for i in {1..10}; do
        for frame in "${frames[@]}"; do
            echo -ne "\r[${frame}] Loading... "
            sleep $delay
        done
    done
    echo -e "\r[✔] Loaded!"
}

# Function to gather website information
gather_info() {
    local url=$1

    echo "Gathering information for ${url}..."

    # Whois lookup
    echo -e "\nWhois lookup:"
    whois $url

    # Ping test
    echo -e "\nPing test:"
    ping -c 4 $url

    # Traceroute
    echo -e "\nTraceroute:"
    traceroute $url

    # Nslookup
    echo -e "\nNslookup:"
    nslookup $url

    # Curl to get HTTP headers
    echo -e "\nHTTP headers:"
    curl -I $url
}

# Main script
clear
display_banner
echo -e "\nWelcome to the Website Information Checker!"

# Read the URL from the user
read -p "Enter the website URL: " url

# Display hacker animation
hacker_animation

# Gather and display website information
gather_info $url

echo -e "\nInformation gathering completed."