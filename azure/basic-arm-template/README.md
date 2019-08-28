# Basic Arm Template

## Introduction

Azure Resource Manager is the deployment and management service for Azure. It provides a consistent management layer that enables you to create, update, and delete resources in your Azure subscription. You can use its access control, auditing, and tagging features to secure and organize your resources after deployment.

Use this blueprint to provision a single VM using an ARM template.

## Before you get started

If you're new to XebiaLabs blueprints, check out:

* [Get started with DevOps as Code](https://docs.xebialabs.com/xl-platform/concept/get-started-with-devops-as-code.html)
* [Get started with blueprints](https://docs.xebialabs.com/xl-platform/concept/get-started-with-blueprints.html)

## Usage

To use this blueprint, run `xl blueprint` in an empty directory and select:

```plain
azure/basic-arm-template
```

## Tools and technologies

This blueprint includes the following tools and technologies:

* Tools:
    * [XebiaLabs Deployment Automation](https://xebialabs.com/products/xl-deploy/)
    * [ARM](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-authoring-templates)


## Minimum required versions

This blueprint version requires at least the following versions of the specified tools to work properly:

* XL Deploy: Version 9.0.0
* XL Release: Version 9.0.0
* XL CLI: Version 9.0.0

## Prerequisites

To run the YAML that this blueprint generates, you need:
* Azure login credentials in order to deploy the template
* [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/). Ensure that you are [signed in](https://docs.microsoft.com/en-us/cli/azure/authenticate-azure-cli?view=azure-cli-latest).

### Create a functional user under your subscription

You must configure the Azure provider with the `subscription_id`, `client_id`, `client_secret` and `tenant_id`. If you do not have these details you can use the `az` command line tool to obtain them.

> Note: Ensure that you have the [AZ CLI](https://docs.microsoft.com/en-us/cli/azure/) and you are [signed in](https://docs.microsoft.com/en-us/cli/azure/authenticate-azure-cli?view=azure-cli-latest).

Once you are signed in, run the command below to see a list of accounts you can access:

```plain
$ az account list
```

Example results:
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

In this output:
* `appId` is your `client_id`
* `password` is your `client_secret`
* `tenant` is your `tenant_id`

> Note: You already retrieved your `subscription_id` in the previous step.


## Output

This blueprint will output:

* ARM template

## Labels

* Cloud
* Microsoft
* Azure
