# Basic composability demo with EKS/AKS/GKE cluster, Kubernetes application and an XLR pipeline

## Introduction

Use this blueprint to deploy an application on a Kubernetes cluster running in AWS, Azure or GCP.

## Before you get started

If you're new to XebiaLabs blueprints, check out:

* [Get started with DevOps as Code](https://docs.xebialabs.com/xl-release/concept/get-started-with-devops-as-code.html)
* [Get started with blueprints](https://docs.xebialabs.com/xl-release/concept/get-started-with-blueprints.html)

## Prerequisites

* XebiaLabs Release Orchestration and Deployment Automation up and running

## Usage

To use this blueprint, run `xl blueprint` in an empty directory and select:

```plain
kubernetes/multicloud-pipeline
```

1. When you run this blueprint, you must choose one of the following platforms:
    1. Azure AKS
    2. Amazon EKS
    3. Google GKE
2. Start an instance of XLD and XLR using the `xl-devops-platform` blueprint generated in the `docker` directory
3. Apply this blueprint to the above platform
4. In XLR, find the template you created and start a deployment

## Tools and technologies

This blueprint includes the following tools and technologies:

* Target:
  * Kubernetes

## Minimum required versions

This blueprint version requires at least the following versions of the specified tools to work properly:

* XL Release: Version 9.0
* XL Deploy: Version 9.0
* XL CLI: Version 9.0

## Information required

* The cluster name
* Docker image for a front-end service

## Output

* Release templates
* A docker-compose setup for XL Release, XL Deploy & Docker proxy

## Labels

* Kubernetes

