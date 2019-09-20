# Microservice Application on Amazon EKS

## Introduction

Amazon Elastic Container Service for Kubernetes (EKS) allows you to deploy, manage, and scale containerized applications in the cloud using Kubernetes.

Use this blueprint to deploy a sample microservice-based application on EKS. The release template that the blueprint generates connects to an existing EKS cluster or provisions a new cluster and deploys the sample application to it.

## Before you get started

If you're new to XebiaLabs blueprints, check out:

* [Get started with DevOps as Code](https://docs.xebialabs.com/xl-release/concept/get-started-with-devops-as-code.html)
* [Get started with blueprints](https://docs.xebialabs.com/xl-release/concept/get-started-with-blueprints.html)

## Usage

To use this blueprint, run `xl blueprint` and select:

    aws/microservice-ecommerce

## Tools and technologies

This blueprint includes the following tools and technologies:

* Target:
    * [Amazon Elastic Container Service for Kubernetes (EKS)](https://aws.amazon.com/eks/)
    * [Amazon Simple Storage Service (S3)](https://aws.amazon.com/s3/)
* Tools:
    * [XebiaLabs Release Orchestration](https://xebialabs.com/products/xl-release/)
    * [XebiaLabs Deployment Automation](https://xebialabs.com/products/xl-deploy/)
    * [AWS CloudFormation](https://aws.amazon.com/cloudformation/)
    * [Jenkins](https://jenkins.io/)
    * [Kubernetes](https://kubernetes.io/)
    * [AWS Lambda](https://aws.amazon.com/lambda/)
* Application or framework:
    * [JHipster](https://github.com/xebialabs/e-commerce-microservice/)

## Minimum required versions

This blueprint version requires at least the following versions of the specified tools to work properly:

XL Release: Version 9.0.0
XL Deploy: Version 9.0.0
XL CLI: Version 9.0.0

## Prerequisites

To run the YAML that this blueprint generates, you need:

* XebiaLabs Release Orchestration and Deployment Automation up and running
* Access to an AWS account to deploy the application to
* A Jenkins server up and running

## Information required

This blueprint requires:

* AWS credentials
* An AWS region
* The Amazon EKS cluster endpoint (if deploying to an existing cluster)
* The Kubernetes namespace

## Output

This blueprint will output:

* Release templates
* AWS CloudFormation templates
* Infrastructure:
    * Amazon EKS cluster (master, workers, config map, namespace)
    * Amazon S3 bucket for the application
    * AWS Lambda artifacts for the application
    * Networking infrastructure: Virtual Private Cloud (VPC), subnets, route table
    * Security infrastructure: IAM role
* A docker-compose setup for XL Release, XL Deploy and Jenkins

## Tips and tricks

* Jenkins is essential to use the release template that this blueprint generates. Before you execute the `xl apply` command, define a Jenkins server as a shared configuration in XL Release and put its name in the `xlr-pipeline-ci-cd.yaml` file. If you use the provided docker-compose files this will be automatically setup for you.
* The YAML that the blueprint generates includes optional steps to remove the application and deprovision the cluster.

## Labels

* Cloud
* AWS
* Kubernetes
