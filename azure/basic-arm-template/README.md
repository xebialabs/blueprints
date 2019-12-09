# Basic ARM Template

## Introduction

Azure Resource Manager is the deployment and management service for Azure. It provides a consistent management layer that enables you to create, update, and delete resources in your Azure subscription. You can use its access control, auditing, and tagging features to secure and organize your resources after deployment.

Use this blueprint to provision a single VM using an ARM template.

## Before you get started

If you're new to XebiaLabs blueprints, check out:

* [Get started with DevOps as Code](https://docs.xebialabs.com/xl-release/concept/get-started-with-devops-as-code.html)
* [Get started with blueprints](https://docs.xebialabs.com/xl-release/concept/get-started-with-blueprints.html)

## Usage

To use this blueprint, run `xl blueprint` in an empty directory and select:

```plain
azure/basic-arm-template
```

## Tools and technologies

This blueprint includes the following tools and technologies:

* Target:
  * [Azure Resource Manager (ARM)](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-overview)
* Tools:
  * [XebiaLabs Deployment Automation](https://xebialabs.com/products/xl-deploy/)
  * [ARM](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-authoring-templates)

## Minimum required versions

This blueprint version requires at least the following versions of the specified tools to work properly:

* XL Release: Version 9.0.0
* XL Deploy: Version 9.0.0
* XL CLI: Version 9.0.0

## Prerequisites

To run the YAML that this blueprint generates, you need:

* XebiaLabs Release Orchestration and Deployment Automation up and running
* Azure credentials that allow creating the infrastructure

## Information required

* Azure Credentials
* Azure Resource Group
* Azure Region

## Output

* Release templates
* ARM template

## Labels

* Cloud
* Microsoft
* Azure

