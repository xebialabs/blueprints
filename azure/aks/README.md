# Provisioning AKS Cluster

## Before you get started

If you're new to XebiaLabs blueprints, check out:

* [Get started with DevOps as Code](https://docs.xebialabs.com/xl-platform/concept/get-started-with-devops-as-code.html)
* [Get started with blueprints](https://docs.xebialabs.com/xl-platform/concept/get-started-with-blueprints.html)
* [Get started with XL JetPack](https://docs.xebialabs.com/xl-platform/concept/get-started-with-xl-jetpack.html)

## Prerequisites

### Authenticate to Azure

### Creating a functional user under your subscription

We need to configure the Azure provider with the `subscription_id`, `client_id`, `client_secret` and `tenant_id`. If you do not have these details you can use the `az` command line tool to obtain them.

Make sure you've download the [AZ CLI](https://docs.microsoft.com/en-us/cli/azure/) and you're [signed in](https://docs.microsoft.com/en-us/cli/azure/authenticate-azure-cli?view=azure-cli-latest).

```sh
$ az account list
```

Which will show you something like:
```json
[
  {
    "cloudName": "AzureCloud",
    "id": "5dses33-f595-3333-6666-77788889997",
    "isDefault": true,
    "name": "Free Trial",
    "state": "Enabled",
    "tenantId": "7f3c634b-3ds4-23fe-8aa7-dme3jdwejqdxv",
    "user": {
      "name": "user@email.com",
      "type": "user"
    }
  }
]
```

The `id` you see here is your `subscription_id`. You copy that value and paste it in the command below to create a functional user that has privileges to spin up a managed K8s cluster.

```sh
$ az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/your_subscription_id"
```

This will output something like this:

```json
{
  "appId": "99999-0000-8888-7777-888877776755",
  "displayName": "azure-cli-2019-04-19-17-32-40",
  "name": "http://azure-cli-2019-04-19-17-32-40",
  "password": "77778888-7788-9998-92fc-huoui89889",
  "tenant": "7f3c634b-3ds4-23fe-8aa7-dme3jdwejqdxv"
}
```

In this output, `appId` is your `client_id`, `password` is your `client_secret` and `tenant` is your `tenant_id`. You already retrieved your `subscription_id` in the previous step.

## Usage

To use this blueprint, run `xl blueprint` and select:

    azure/aks

1. Run and answer all the questions.

```sh 
$ xl blueprint
```

To deploy this blueprint, read the usage instruction in the `USAGE.md` amongst the generated files.

## Minimum Required versions

This blueprint version requires at least the below versions of the specified tools to work properly.

- XL Deploy: Version 8.6.1
- XL CLI: Version 8.6