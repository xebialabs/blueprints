# Basic Google Kubernetes Engine Cluster

## Introduction

Google Kubernetes Engine (GKE) allows you to deploy, manage, and scale containerized applications in the cloud using Kubernetes.

Use this blueprint to provision a GKE cluster using Terraform.

## Before you get started

If you're new to XebiaLabs blueprints, check out:

* [Get started with DevOps as Code](https://docs.xebialabs.com/xl-platform/concept/get-started-with-devops-as-code.html)
* [Get started with blueprints](https://docs.xebialabs.com/xl-platform/concept/get-started-with-blueprints.html)
* [Get started with XL JetPack](https://docs.xebialabs.com/xl-platform/concept/get-started-with-xl-jetpack.html)

## Usage

To use this blueprint, run `xl blueprint` and select:

    `gcp/basic-gke-cluster`

## Tools and technologies

This blueprint includes the following tools and technologies:

* Target:
    * [Google Kubernetes Engine (GKE)](https://cloud.google.com/kubernetes-engine/)
* Tools:
    * [XebiaLabs Deployment Automation](https://xebialabs.com/products/xl-deploy/)
    * [Kubernetes](https://kubernetes.io/)
    * [Terraform](https://www.terraform.io/)

## Minimum required versions

This blueprint version requires at least the following versions of the specified tools to work properly:

* XL Deploy: Version 9.0.0
* XL CLI: Version 9.0.0
* Terraform: Version 0.12.0

## Prerequisites

To run the YAML that this blueprint generates, you need:

* XebiaLabs Deployment Automation up and running
* Access to a Google Cloud Platform (GCP) account to deploy the GKE Cluster to

## Information required

This blueprint requires a:

* GCP project ID
* GCP region

### Create a Google Cloud project

#### Authenticate to gcloud

Before running the `gcloud init` command, you can check for available zones and regions nearest to your location:

```sh
gcloud compute regions list

gcloud compute zones list
```

Run `gcloud init` and select a default zone (for example, `europe-west1`). Make sure you use the same zone as the one that you select when you answer the blueprint's questions.

```sh
gcloud init
```

> Note: You must have the appropriate permissions in the GCP account to execute these commands. If you are using a personal account, you should have these permissions, as you are the admin. If you are using a company/enterprise account, check with your account administrator.

#### Set up environment

> Note: If you are creating the project using the GUI instead of the commands below, there will be a project number, a project name and a project ID when you initialize the project, and only ID should be exported as `TF_ADMIN` variable.

```sh
export TF_ADMIN=[GCP project ID]
```

#### Create the GCP project

Create a new project and link it to your billing account using the `gcloud` command.

> Note: You can also create the project using the GCP console GUI. See the GUI documentation for details.

First, retrieve the values of YOUR_ORG_ID and YOUR_BILLING_ACCOUNT_ID by executing the following commands:

```sh
gcloud organizations list

gcloud beta billing accounts list
```

Using these details, run the following commands:

```sh
gcloud projects create ${TF_ADMIN} \
--organization [YOUR_ORG_ID] \
--set-as-default

gcloud beta billing projects link ${TF_ADMIN} \
--billing-account [YOUR_BILLING_ACCOUNT_ID]
```

## Output

This blueprint will output:

* Terraform templates
* Infrastructure:
    * GKE cluster (master, nodes)
    * Networking infrastructure: Virtual Private Cloud (VPC), subnets
    * Security infrastructure
* A docker-compose setup for XL Deploy

## Labels

* Cloud
* Google
* Kubernetes
* Terraform
