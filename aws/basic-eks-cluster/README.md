# Basic AWS Kubernetes Engine Cluster

## Introduction

Amazon Elastic Container Service for Kubernetes (EKS) allows you to deploy, manage, and scale containerized applications in the cloud using Kubernetes.

Use this blueprint to provision a GKE cluster using CloudFormation.

## Before you get started

If you're new to XebiaLabs blueprints, check out:

* [Get started with DevOps as Code](https://docs.xebialabs.com/xl-platform/concept/get-started-with-devops-as-code.html)
* [Get started with blueprints](https://docs.xebialabs.com/xl-platform/concept/get-started-with-blueprints.html)
* [Get started with XL JetPack](https://docs.xebialabs.com/xl-platform/concept/get-started-with-xl-jetpack.html)

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
    * [Kubernetes](https://kubernetes.io/)
    * [CloudFormation](https://aws.amazon.com/cloudformation/)

## Minimum required versions

This blueprint version requires at least the following versions of the specified tools to work properly:

* XL Deploy: Version 8.6.1
* XL CLI: Version 8.6.1

## Prerequisites

To run the YAML that this blueprint generates, you need:

* XebiaLabs Deployment Automation up and running
* Access to an AWS account that can deploy EKS clusters and create S3 storage
* [AWS CLI](https://aws.amazon.com/cli/)

## Information required
* AWS Access Key (find it in `~/.aws/credentials`)
* AWS Secret Access Key (find it in `~/.aws/credentials`)

## Output

This blueprint will output:

* CloudFormation templates
* Infrastructure:
    * EKS cluster (master, nodes)

**Note:** You will find more instructions in `xebialabs/USAGE-aws-basic-eks-cluster.md` after you have run the blueprint.

## Notes

None

## Labels

* Cloud
* Amazon
* AWS
* Kubernetes
* CloudFormation
