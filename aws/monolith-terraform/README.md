# Monolithic Application on Amazon ECS with Terraform

## Introduction

Amazon Elastic Container Service (ECS) is a container orchestration service for Docker-enabled applications. It works with AWS Fargate, a compute engine that allows you to run containers on ECS without having to manage servers or clusters.

Use this blueprint to deploy a monolithic application on ECS with the Fargate launch type, using Terraform to define the infrastructure that will run on ECS. The release template that the blueprint generates will provision a new ECS cluster and deploy a sample application to it.

## Before you get started

If you're new to XebiaLabs blueprints, check out:

* [DevOps as Code overview](https://docs.xebialabs.com/xl-platform/concept/devops-as-code-overview.html)
* [Getting started with DevOps as Code](https://docs.xebialabs.com/xl-platform/concept/getting-started-with-devops-as-code.html)
* [Using the XebiaLabs Command-Line Interface (CLI)](https://docs.xebialabs.com/xl-platform/concept/xl-command-line-interface.html)

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

* Sample monolithic application
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
