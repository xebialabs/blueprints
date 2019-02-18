# Microservice Application on Google Kubernetes Engine

## Introduction

Google Kubernetes Engine (GKE) allows you to deploy, manage, and scale containerized applications in the cloud using Kubernetes.

Use this blueprint to deploy a sample microservice-based microservice-based application on GKE using Terraform, which defines the infrastructure that will run on GKE. The release template that the blueprint generates connects to an existing GKE cluster or provisions a new cluster and deploys a sample application to it.

## Before you get started

If you're new to XebiaLabs blueprints, check out:

* [DevOps as Code overview](https://docs.xebialabs.com/xl-platform/concept/devops-as-code-overview.html)
* [Getting started with DevOps as Code](https://docs.xebialabs.com/xl-platform/concept/getting-started-with-devops-as-code.html)
* [Using the XebiaLabs Command-Line Interface (CLI)](https://docs.xebialabs.com/xl-platform/concept/xl-command-line-interface.html)

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

## Prerequisites

To run the YAML that this blueprint generates, you need:

* XebiaLabs Release Orchestration and Deployment Automation up and running
* Access to a Google Cloud Platform (GCP) account to deploy the application to
* A Jenkins server up and running

## Information required

This blueprint requires:

* GCP project ID
* A GCP region
* The GKE cluster endpoint (if deploying to an existing cluster)
* Kubernetes cluster credentials
* The Kubernetes namespace
* Jenkins credentials (if enabling CI integration)

## Output

This blueprint will output:

* Sample microservice-based application
* Release templates
* Terraform templates
* Infrastructure:
    * GKE cluster (master, nodes)
    * Networking infrastructure: Virtual Private Cloud (VPC), subnets
    * Security infrastructure

## Tips and tricks

* If you opt to use Jenkins in the release template that this blueprint generates, before you run the xl apply command, define a Jenkins server as a shared configuration in XL Release and put its name in the `xlr-pipeline-ci-cd.yaml` file.
* The YAML that the blueprint generates includes optional steps to remove the application and deprovision the cluster.

## Labels

* Cloud
* Google
* Kubernetes
* Terraform
