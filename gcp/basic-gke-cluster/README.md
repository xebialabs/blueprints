# Basic Google Kubernetes Engine Cluster

## Introduction

Google Kubernetes Engine (GKE) allows you to deploy, manage, and scale containerized applications in the cloud using Kubernetes.

Use this blueprint to provision a GKE cluster using Terraform.

## Before you get started

If you're new to XebiaLabs blueprints, check out:

* [Get started with DevOps as Code](https://docs.xebialabs.com/xl-release/concept/get-started-with-devops-as-code.html)
* [Get started with blueprints](https://docs.xebialabs.com/xl-release/concept/get-started-with-blueprints.html)

## Usage

To use this blueprint, run `xl blueprint` in an empty directory and select:

```plain
gcp/basic-gke-cluster
```

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

## Prerequisites

To run the YAML that this blueprint generates, you need:

* XebiaLabs Release Orchestration and Deployment Automation up and running
* Access to a Google Cloud Platform (GCP) account where you can deploy the GKE Cluster

## Information required

* A GCP project ID
* A GCP region

## Output

* Release templates
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

