# Basic AKS Cluster

## Introduction

Azure Kubernetes Service (AKS) allows you to deploy, manage, and scale containerized applications in the cloud using Kubernetes.

Use this blueprint to provision a simple AKS cluster using Terraform, which defines the infrastructure that will run on AKS.

## Before you get started

If you're new to XebiaLabs blueprints, check out:

* [Get started with DevOps as Code](https://docs.xebialabs.com/xl-release/concept/get-started-with-devops-as-code.html)
* [Get started with blueprints](https://docs.xebialabs.com/xl-release/concept/get-started-with-blueprints.html)

## Prerequisites

* XebiaLabs Deployment Automation up and running
* Azure credentials that allow creating the infrastructure
* See the Azure [README.md](https://github.com/xebialabs/blueprints/blob/master/azure/README.md) for instruction on how to set this up

## Usage

To use this blueprint, run `xl blueprint` in an empty directory and select:

```plain
azure/basic-aks-cluster
```

## Tools and technologies

This blueprint includes the following tools and technologies:

* Target:
  * [Azure Kubernetes Service (AKS)](https://azure.microsoft.com/en-us/services/kubernetes-service/)
* Tools:
  * [XebiaLabs Deployment Automation](https://xebialabs.com/products/xl-deploy/)
  * [Kubernetes](https://kubernetes.io/)
  * [Terraform](https://www.terraform.io/)

## Minimum required versions

This blueprint version requires at least the following versions of the specified tools to work properly:

* XL Deploy: Version 9.0.0
* XL CLI: Version 9.0.0

## Information required

* Azure Credentials
* Azure Resource Group
* Azure Region

## Output

* Release templates
* Terraform templates
* Infrastructure:
  * AKS cluster (master, nodes)

## Labels

* Cloud
* Microsoft
* Azure
* Kubernetes

