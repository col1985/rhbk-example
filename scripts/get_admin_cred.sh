#!/usr/bin/env bash

set -e

oc get secret rh-keycloak-initial-admin \
  -o jsonpath='{.data.username}' | base64 --decode ;  \
  echo &&
oc get secret rh-keycloak-initial-admin \
  -o jsonpath='{.data.password}' | base64 --decode ; \
  echo