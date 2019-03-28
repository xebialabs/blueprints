# Monolithic Application on Amazon ECS with Terraform

## Introduction

Amazon Elastic Container Service (ECS) is a container orchestration service for Docker-enabled applications. It works with AWS Fargate, a compute engine that allows you to run containers on ECS without having to manage servers or clusters.

Use this blueprint to deploy a monolithic application on ECS with the Fargate launch type, using Terraform to define the infrastructure that will run on ECS. The release template that the blueprint generates will provision a new ECS cluster and deploy a sample application to it.

## Before you get started

If you're new to XebiaLabs blueprints, check out:

* [Get started with DevOps as Code](https://docs.xebialabs.com/xl-platform/concept/get-started-with-devops-as-code.html)
* [Get started with blueprints](https://docs.xebialabs.com/xl-platform/concept/get-started-with-blueprints.html)
* [Get started with XL JetPack](https://docs.xebialabs.com/xl-platform/concept/get-started-with-xl-jetpack.html)

## Usage

To use this blueprint, run `xl blueprint` and select:

    aws/monolith-terraform

## Tools and technologies

This blueprint includes the following tools and technologies:

* Target:
    * [Amazon Elastic Container Service (ECS)](https://aws.amazon.com/ecs/)
    * [AWS Fargate](https://aws.amazon.com/fargate/)
* Tools:
    * [XebiaLabs Release Orchestration](https://xebialabs.com/products/xl-release/)
    * [XebiaLabs Deployment Automation](https://xebialabs.com/products/xl-deploy/)
    * [Terraform](https://www.terraform.io/)
* Application or framework:
    * [JHipster](https://github.com/xebialabs/e-commerce-monolith)

## Minimum Required versions

This blueprint version requires at least the below versions of the specified tools to work properly.

XL Release: Version 8.6
XL Deploy: Version 8.6.1
XL CLI: Version 8.6

## Prerequisites

To run the YAML that this blueprint generates, you need:

* XebiaLabs Release Orchestration and Deployment Automation up and running
* Access to an AWS account to deploy the application to

## Information required

This blueprint requires:

* The application name
* The port where the application should be exposed
* The MySQL password
* AWS credentials
* An AWS region

## Output

This blueprint will output:

* Release template
* Terraform templates
* Infrastructure:
    * Amazon ECS cluster
    * Networking infrastructure: Virtual Private Cloud (VPC), subnets, route table
    * Security infrastructure
    * Elastic Load Balancer (ELB) infrastructure
    * Amazon Relational Database Service (RDS)

## Tips and tricks

The YAML that the blueprint generates includes optional steps to remove the application and deprovision the cluster.

## Labels

* Cloud
* AWS
* Terraform
