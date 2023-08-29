#!/bin/bash

if ! command -v openssl &> /dev/null; then
    read -p "OpenSSL not found. Install? (y/n): " choice
    if [ "$choice" == "y" ] || [ "$choice" == "Y" ]; then
        sudo apt-get update
        sudo apt-get install openssl
    else
        exit 1
    fi
fi

CERTS_DIR="/home/$USER/.certs"

mkdir -p "$CERTS_DIR" /home/$USER/data/db_data /home/$USER/data/wp_data

cd /home/$USER/.certs

openssl req -x509 -newkey rsa:4096 -keyout private.key -out certificate.crt -days 365 -nodes -subj "/CN=localhost"

echo "SSL certs generated in $CERTS_DIR and volumes folders created in /home/$USER/data"
