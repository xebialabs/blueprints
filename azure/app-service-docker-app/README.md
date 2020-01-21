# Azure App Service

## Introduction

Azure App Service allows you to deploy, manage, and scale web applications in the cloud.

Use this blueprint to provision a simple Dockerized Web application using Terraform and XL Deploy, which defines the infrastructure that will run on Azure.

## Before you get started

If you're new to XebiaLabs blueprints, check out:

* [Get started with DevOps as Code](https://docs.xebialabs.com/xl-release/concept/get-started-with-devops-as-code.html)
* [Get started with blueprints](https://docs.xebialabs.com/xl-release/concept/get-started-with-blueprints.html)

## Prerequisites

* XebiaLabs Deployment Automation up and running
* Azure credentials that allow creating the infrastructure
* See the Azure [README.md](https://github.com/xebialabs/blueprints/blob/master/azure/README.md) for instruction on how to set this up

## Security warning

This blueprint will store your Azure credentials as well as the MySQL password in plain text in a file called `xebialabs/secrets.xlvals`. This is not production-level secure. If you wish to use a more secure method for dealing with secrets and passwords, refer to the `showcases/dictionaries-and-secret-stores` blueprint for a demonstration that uses CyberArk Conjur or HashiCorp Vault to better store and handle secrets.

## Usage

To use this blueprint, run `xl blueprint` in an empty directory and select:

```plain
azure/app-service-docker-app
```

## Tools and technologies

This blueprint includes the following tools and technologies:

* Target:
  * [Azure App Service](https://azure.microsoft.com/en-in/services/app-service/)
* Tools:
  * [XebiaLabs Deployment Automation](https://xebialabs.com/products/xl-deploy/)
  * [Terraform](https://www.terraform.io/)

## Minimum required versions

This blueprint version requires at least the following versions of the specified tools to work properly:

* XL Deploy: Version 9.0
* XL CLI: Version 9.0

## Information required

* Azure Credentials
* Azure Resource Group
* Azure Region

## Output

* Release templates
* Terraform templates
* Infrastructure:
  * AppService
  * MySQL server

## Labels

* Cloud
* Microsoft
* Azure
* AppService
* Docker

