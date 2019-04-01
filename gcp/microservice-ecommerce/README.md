# Microservice Application on Google Kubernetes Engine

## Introduction

Google Kubernetes Engine (GKE) allows you to deploy, manage, and scale containerized applications in the cloud using Kubernetes.

Use this blueprint to deploy a sample microservice-based application on GKE using Terraform, which defines the infrastructure that will run on GKE. The release template that the blueprint generates connects to an existing GKE cluster or provisions a new cluster and deploys a sample application to it.

## Before you get started

If you're new to XebiaLabs blueprints, check out:

* [Get started with DevOps as Code](https://docs.xebialabs.com/xl-platform/concept/get-started-with-devops-as-code.html)
* [Get started with blueprints](https://docs.xebialabs.com/xl-platform/concept/get-started-with-blueprints.html)
* [Get started with XL JetPack](https://docs.xebialabs.com/xl-platform/concept/get-started-with-xl-jetpack.html)

## Usage

To use this blueprint, run `xl blueprint` and select:

    gcp/microservice-ecommerce

## Tools and technologies

This blueprint includes the following tools and technologies:

* Target:
    * [Google Kubernetes Engine (GKE)](https://cloud.google.com/kubernetes-engine/)
* Tools:
    * [XebiaLabs Release Orchestration](https://xebialabs.com/products/xl-release/)
    * [XebiaLabs Deployment Automation](https://xebialabs.com/products/xl-deploy/)
    * [Jenkins](https://jenkins.io/)
    * [Kubernetes](https://kubernetes.io/)
    * [Terraform](https://www.terraform.io/)
* Application or framework:
    * [JHipster](https://github.com/xebialabs/e-commerce-microservice/)

## Minimum Required versions

This blueprint version requires at least the below versions of the specified tools to work properly.

XL Release: Version 8.6
XL Deploy: Version 8.6.1
XL CLI: Version 8.6

## Prerequisites

To run the YAML that this blueprint generates, you need:

* XebiaLabs Release Orchestration and Deployment Automation up and running
* Access to a Google Cloud Platform (GCP) account to deploy the application to
* A Jenkins server up and running

## Information required

This blueprint requires:

* GCP project ID (see section below for instructions)
* A GCP region
* The GKE cluster endpoint (if deploying to an existing cluster)
* Kubernetes cluster credentials
* The Kubernetes namespace
* Jenkins credentials (if enabling CI integration)

### Creating Google Cloud project

#### Authenticate to gcloud
Before configuring gcloud CLI you can check available Zones and Regions nearest to your location

```sh
gcloud compute regions list

gcloud compute zones list
```

Follow gcloud init and select default Zone Ex. europe-west1, make sure you use the same zone as the one selected during blueprint execution.

```sh
gcloud init
```

> NOTE: You need to have proper permissions and privileges in the GCP account to execute these commands. If you are using a personal account you should be having these as you will be the admin. If you are using a company/enterprise account please check with your account administrator. 

#### Set up environment

> NOTE: If you are creating the Project via GUI instead of below commands, there will be a project number, a project name and a project ID when you initialize the project, and only ID should be exported as `TF_ADMIN` variable.

```sh
export TF_ADMIN=[GCP project ID]
```

#### Create the GCP Project

Create a new project and link it to your billing account (You could do it from the GCP console GUI as well, in that case skip the below command)

> NOTE: The value of YOUR_ORG_ID and YOUR_BILLING_ACCOUNT_ID can be found by running below commands

```sh
gcloud organizations list

gcloud beta billing accounts list
```

Once you have the details run the below commands

```sh
gcloud projects create ${TF_ADMIN} \
--organization [YOUR_ORG_ID] \
--set-as-default

gcloud beta billing projects link ${TF_ADMIN} \
--billing-account [YOUR_BILLING_ACCOUNT_ID]
```

## Output

This blueprint will output:

* Release templates
* Terraform templates
* Infrastructure:
    * GKE cluster (master, nodes)
    * Networking infrastructure: Virtual Private Cloud (VPC), subnets
    * Security infrastructure
* A docker-compose setup for XL JetPack and Jenkins

## Tips and tricks

* If you opt to use Jenkins in the release template that this blueprint generates, before you run the xl apply command, define a Jenkins server as a shared configuration in XL Release and put its name in the `xlr-pipeline-ci-cd.yaml` file. If you use the provided docker-compose files this will be automatically setup for you.
* The YAML that the blueprint generates includes optional steps to remove the application and deprovision the cluster.

## Labels

* Cloud
* Google
* Kubernetes
* Terraform
