# Azure App Service

## Introduction

Azure App Service allows you to deploy, manage, and scale web applications in the cloud.

Use this blueprint to provision a simple Dockerized Web application using Terraform and XL Deploy, which defines the infrastructure that will run on Azure.

## Before you get started

If you're new to XebiaLabs blueprints, check out:

* [Get started with DevOps as Code](https://docs.xebialabs.com/xl-release/concept/get-started-with-devops-as-code.html)
* [Get started with blueprints](https://docs.xebialabs.com/xl-release/concept/get-started-with-blueprints.html)

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

