#!/usr/bin/env bash

set -e

oc create secret tls example-tls-secret --cert certificate.pem --key key.pem &&

oc create secret generic keycloak-db-secret \
  --from-literal=username=testuser \
  --from-literal=password=testpassword