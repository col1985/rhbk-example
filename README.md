# RHBK Development Deployment Example

![linter workflow](https://github.com/col1985/rhbk-example/actions/workflows/super-linter.yml/badge.svg)

## Description

This repository is to provide some config files and scripts to facilate the deployment of Red Hat build of Keycloak into Openshift based on  this [documentation](https://docs.redhat.com/en/documentation/red_hat_build_of_keycloak/26.0/html/operator_guide/basic-deployment-#basic-deployment-deploying-red-hat-build-of-keycloak)

Ensure that you are logged into an Openshift cluster to be able to complete all steps listed below.

### Setup

Set sesion env var for the namespace and hostname.

```bash
export NAMESPACE=rhbk-playground
export HOSTNAME=<hostname for cluster>
```

### create namespace

```bash
oc apply -f config/namespace.yaml
```

### Install Operator

#### Via OC client

```bash
oc project $NAMESPACE
oc apply -f config/rhbk-operator.yaml
```

#### Via Openshift Web Console

1. Navigate to Operators, select OperatorHub
2. Search for Red Hat build of Keycloak
3. Select and click install

### Install development database

```bash
oc apply -f config/rhbk-postgres.yaml
```

### Create TLS cert & key

```bash
sh scripts/gen_tls_cert_and_key.sh
```

### Upload secrets to Openshift

```bash
sh scripts/set_rhbk_secrets.sh
```

### Deploying Keycloak

```bash
sh scripts/create_keycloak.sh
```

### Check deployment status

```bash
oc get keycloaks/rh-keycloak -o go-template='{{range .status.conditions}}CONDITION: {{.type}}{{"\n"}}  STATUS: {{.status}}{{"\n"}}  MESSAGE: {{.message}}{{"\n"}}{{end}}'
```

### Get initial Admin credentials

```bash
sh get_admin_cred.sh
```

## Configuring RHBK

View the documentation to get start with Keycloak [here](https://docs.redhat.com/en/documentation/red_hat_build_of_keycloak/26.0/html/getting_started_guide/getting-started-zip-#getting-started-zip-before-you-start)
