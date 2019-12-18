# Basic AWS Elastic Kubernetes Service (EKS) Cluster

## Introduction

Amazon Elastic Container Service for Kubernetes (EKS) allows you to deploy, manage, and scale containerized applications in the cloud using Kubernetes.

Use this blueprint to provision a very basic EKS cluster using a CloudFormation Stack.

## Before you get started

If you're new to XebiaLabs blueprints, check out:

* [Get started with DevOps as Code](https://docs.xebialabs.com/xl-release/concept/get-started-with-devops-as-code.html)
* [Get started with blueprints](https://docs.xebialabs.com/xl-release/concept/get-started-with-blueprints.html)

## Prerequisites

* XebiaLabs Deployment Automation up and running
* AWS Access Key and Secret Key for an account that can deploy the application
* See the AWS [README.md](https://github.com/xebialabs/blueprints/blob/master/aws/README.md) for instructions on how to set this up

## Usage

To use this blueprint, run `xl blueprint` in an empty directory and select:

```plain
aws/basic-eks-cluster
```

## Tools and technologies

This blueprint includes the following tools and technologies:

* Target:
  * [Amazon Elastic Container Service for Kubernetes (EKS)](https://aws.amazon.com/eks/)
* Tools:
  * [XebiaLabs Deployment Automation](https://xebialabs.com/products/xl-deploy/)
  * [CloudFormation](https://aws.amazon.com/cloudformation/)
  * [Kubernetes](https://kubernetes.io/)

## Minimum required versions

This blueprint version requires at least the following versions of the specified tools to work properly:

* XL Deploy: Version 9.0
* XL CLI: Version 9.0

## Information required

* AWS Access Key (find it in `~/.aws/credentials`)
* AWS Secret Access Key (find it in `~/.aws/credentials`)
* An AWS region

## Output

* Release templates
* AWS CloudFormation templates
* Infrastructure:
  * EKS cluster (master, nodes)

## Labels

* Cloud
* AWS
* CloudFormation
* Kubernetes

