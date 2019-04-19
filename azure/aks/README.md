# Provisioning AKS Cluster

## Prerequisites

### Authenticate to Azure

### Creating Google Cloud project and service account for terraform

We need to configure the provider with the subscription_id, client_id, client_secret and tenant_id. 

If you do not have these details you can use the `az` command line tool to obtain them:

```sh
$ az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/your_subscription_id"
```

## Using the blueprint

1. Run and answer all the questions.

```sh 
xl blueprint -b `pwd`
```

To deploy this blueprint with the XebiaLabs DevOps Platform, follow the steps below:

1. Apply the generated YAML configurations using the XL CLI.

```sh
xl apply -f xebialabs.yaml
```



## Minimum Required versions

This blueprint version requires at least the below versions of the specified tools to work properly.

XL Release: Version 8.6
XL Deploy: Version 8.6.1
XL CLI: Version 8.6