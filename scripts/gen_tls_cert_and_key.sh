#!/usr/bin/env bash

set -e

echo "Generating TLS cert & key for " $NAMESPACE.$HOSTNAME

openssl req -subj '/CN=$(echo $NAMESPACE.$HOSTNAME)/O=Test Keycloak./C=US' -newkey rsa:2048 -nodes -keyout key.pem -x509 -days 365 -out certificate.pem