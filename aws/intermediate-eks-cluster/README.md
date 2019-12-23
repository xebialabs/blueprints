# Intermediate Amazon EKS Cluster

## Introduction

Amazon Elastic Container Service for Kubernetes (EKS) allows you to deploy, manage, and scale containerized applications in the cloud using Kubernetes.

Use this blueprint to deploy a simple EKS cluster. The release template that the blueprint generates provisions a new cluster.

## Before you get started

If you're new to XebiaLabs blueprints, check out:

* [Get started with DevOps as Code](https://docs.xebialabs.com/xl-release/concept/get-started-with-devops-as-code.html)
* [Get started with blueprints](https://docs.xebialabs.com/xl-release/concept/get-started-with-blueprints.html)

## Prerequisites

* XebiaLabs Release Orchestration and Deployment Automation up and running
* AWS Access Key and Secret Key for an account that can deploy the application

## Usage

To use this blueprint, run `xl blueprint` in an empty directory and select:

```plain
aws/intermediate-eks-cluster
```

## Tools and technologies

This blueprint includes the following tools and technologies:

* Target:
  * [Amazon Elastic Container Service for Kubernetes (EKS)](https://aws.amazon.com/eks/)
  * [Amazon Simple Storage Service (S3)](https://aws.amazon.com/s3/)
* Tools:
  * [XebiaLabs Release Orchestration](https://xebialabs.com/products/xl-release/)
  * [XebiaLabs Deployment Automation](https://xebialabs.com/products/xl-deploy/)
  * [AWS CloudFormation](https://aws.amazon.com/cloudformation/)
  * [Kubernetes](https://kubernetes.io/)
  * [AWS Lambda](https://aws.amazon.com/lambda/)

## Minimum required versions

This blueprint version requires at least the following versions of the specified tools to work properly:

* XL Release: Version 9.0
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
  * EKS cluster (master, workers, config map, namespace)
  * Amazon S3 bucket for the application
  * AWS Lambda artifacts for the application
  * Networking infrastructure: Virtual Private Cloud (VPC), subnets, route table
  * Security infrastructure: IAM role
* A docker-compose setup for XL Release & XL Deploy

## Tips and tricks

* The YAML that the blueprint generates includes optional steps to remove the application and deprovision the cluster.

## Labels

* Cloud
* AWS
* Kubernetes

