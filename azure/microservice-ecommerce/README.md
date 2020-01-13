# Microservice Application on Azure Kubernetes Service

## Introduction

Azure Kubernetes Service (AKS) allows you to deploy, manage, and scale containerized applications in the cloud using Kubernetes.

Use this blueprint to deploy a sample microservice-based application on AKS using Terraform, which defines the infrastructure that will run on AKS. The release template that the blueprint generates connects to an existing AKS cluster or provisions a new cluster and deploys a sample application to it.

## Before you get started

If you're new to XebiaLabs blueprints, check out:

* [Get started with DevOps as Code](https://docs.xebialabs.com/xl-release/concept/get-started-with-devops-as-code.html)
* [Get started with blueprints](https://docs.xebialabs.com/xl-release/concept/get-started-with-blueprints.html)

## Prerequisites

* XebiaLabs Release Orchestration and Deployment Automation up and running
* * Azure credentials that allow creating the infrastructure
* A Jenkins server up and running (only if you want to publish your own Docker images)

## Special instructions

1. Fork the https://github.com/xebialabs/e-commerce-microservice repository
2. Clone your fork of the repository
3. Check out the `gke-blueprint` branch:
    ```plain
    git co -b gke-blueprint origin/gke-blueprint
    ```

> For more detailed instructions, see [Deploy an app to AWS using a blueprint](https://docs.xebialabs.com/v.9.0/xl-release/how-to/deploy-to-aws-using-blueprints)
> **Note:** This blueprint uses the same branch as the Google GKE example

## Usage

To use this blueprint, run `xl blueprint` in **the forked `e-commerce-microservice` directory of the repository you just cloned** and select:

```plain
azure/microservice-ecommerce
```

## Tools and technologies

This blueprint includes the following tools and technologies:

* Target:
  * [Azure Kubernetes Service (AKS)](https://azure.microsoft.com/en-us/services/kubernetes-service/)
* Tools:
  * [XebiaLabs Release Orchestration](https://xebialabs.com/products/xl-release/)
  * [XebiaLabs Deployment Automation](https://xebialabs.com/products/xl-deploy/)
  * [Jenkins](https://jenkins.io/)
  * [Kubernetes](https://kubernetes.io/)
  * [Terraform](https://www.terraform.io/)
* Application or framework:
  * [JHipster](https://github.com/xebialabs/e-commerce-microservice/)

## Minimum required versions

This blueprint version requires at least the following versions of the specified tools to work properly:

* XL Release: Version 9.0
* XL Deploy: Version 9.0
* XL CLI: Version 9.0

## Information required

* Azure Credentials
* Azure Resource Group
* Azure Region
* The AKS cluster endpoint, if you are deploying to an existing cluster
* Azure Storage Account for the Terraform state, if creating a new cluster
* Kubernetes cluster credentials
* The Kubernetes namespace

## Output

* Release templates
* Terraform templates
* Infrastructure:
  * AKS cluster (master, nodes)
  * Security infrastructure
* A docker-compose setup for XL Release, XL Deploy and Jenkins

## Notes

* If you opt to use Jenkins in the release template that this blueprint generates, before you run the `xl apply` command, define a Jenkins server as a shared configuration in XL Release and put its name in the `xlr-pipeline-ci-cd.yaml` file. If you use the provided docker-compose files this will be automatically setup for you.
* The YAML that the blueprint generates includes optional steps to remove the application and deprovision the cluster.

## Labels

* Cloud
* Azure
* Kubernetes
* Terraform

