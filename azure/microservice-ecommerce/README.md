# Microservice Application on Azure Kubernetes Service

## Introduction

Azure Kubernetes Service (AKS) allows you to deploy, manage, and scale containerized applications in the cloud using Kubernetes.

Use this blueprint to deploy a sample microservice-based application on AKS using Terraform, which defines the infrastructure that will run on AKS. The release template that the blueprint generates connects to an existing AKS cluster or provisions a new cluster and deploys a sample application to it.

## Before you get started

If you're new to XebiaLabs blueprints, check out:

* [Get started with DevOps as Code](https://docs.xebialabs.com/xl-release/concept/get-started-with-devops-as-code.html)
* [Get started with blueprints](https://docs.xebialabs.com/xl-release/concept/get-started-with-blueprints.html)

## Usage

To use this blueprint, run `xl blueprint` in an empty directory and select:

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

* XL Release: Version 9.0.0
* XL Deploy: Version 9.0.0
* XL CLI: Version 9.0.0

## Prerequisites

To run the YAML that this blueprint generates, you need:

* XebiaLabs Release Orchestration and Deployment Automation up and running
* * Azure credentials that allow creating the infrastructure
* A Jenkins server up and running (only if you want to publish your own Docker images)

## Information required

* Azure Credentials
* Azure Resource Group
* Azure Region
* The AKS cluster endpoint, if you are deploying to an existing cluster
* Azure Storage Account for the Terraform state, if creating a new cluster (see step 3.2)
* Kubernetes cluster credentials
* The Kubernetes namespace

**Important notes:**

* Use the same location/region in all of the follow steps (e.g. `westus`)
* This blueprint will deploy a Jenkins server for you if you want to test out the CI/CD features
  * The default login is: `admin`/`admin`
* You will either use your own existing Kubernetes cluster or have the blueprint create one for you
  * If you want the blueprint to create a cluster for you, follow the instructions in the `aws/README.md` under **Set up Terraform's backend storage for creating a Kubernetes cluster**.

## Additional steps to run this blueprint

### Clone the `e-commerce-microservice` repository

> **Note:** If you plan to set up the Jenkins CI/CD pipeline, you will first need to fork the XebiaLabs `e-commerce-microservice` repository.

#### With Jenkins CI/CD
If you plan to use the Jenkins CI/CD part of the blueprint, first fork the https://github.com/xebialabs/e-commerce-microservice.git repo.

> **Note:** You will use your GitHub username as the `GITHUB_USER` environment variable when deploying in the next stage.

Make sure you clone the https://github.com/$GITHUB_USER/e-commerce-microservice.git (`gke-blueprint` branch) by running:

```plain
git clone -b gke-blueprint https://github.com/$GITHUB_USER/e-commerce-microservice.git
```

### Without Jenkins CI/CD
Make sure you clone the https://github.com/xebialabs/e-commerce-microservice.git (`gke-blueprint` branch) by running:

```plain
git clone -b gke-blueprint https://github.com/xebialabs/e-commerce-microservice.git
```

## Output

* Release templates
* Terraform templates
* Infrastructure:
  * AKS cluster (master, nodes)
  * Security infrastructure
* A docker-compose setup for XL Release, XL Deploy and Jenkins

> **Note:** You will find more instructions in `xebialabs/USAGE-microservice-ecommerce.md` after you have run the blueprint.

## Notes

* If you opt to use Jenkins in the release template that this blueprint generates, before you run the `xl apply` command, define a Jenkins server as a shared configuration in XL Release and put its name in the `xlr-pipeline-ci-cd.yaml` file. If you use the provided `docker-compose.yml` file this will be automatically setup for you.
* The YAML that the blueprint generates includes optional steps to remove the application and deprovision the cluster.

## Labels

* Cloud
* Microsoft
* Kubernetes
* Terraform

