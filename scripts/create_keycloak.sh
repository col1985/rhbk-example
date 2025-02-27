#!/usr/bin/env bash

set -e

cat << EOF | oc apply -f -
apiVersion: k8s.keycloak.org/v2alpha1
kind: Keycloak
metadata:
  name: rh-keycloak
spec:
  ingress:
    # enabled: false
    className: openshift-default
  instances: 1
  db:
    vendor: postgres
    host: postgres-db
    usernameSecret:
      name: keycloak-db-secret
      key: username
    passwordSecret:
      name: keycloak-db-secret
      key: password
  http:
    tlsSecret: rhbk-tls-secret
  hostname:
    hostname: "$(echo $NAMESPACE.$HOSTNAME)"
  proxy:
    headers: xforwarded