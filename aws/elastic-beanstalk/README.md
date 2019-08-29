# AWS Elastic Beanstalk Sample Application

## Introduction

AWS Elastic Beanstalk is an easy-to-use service for deploying and scaling web applications and services developed with Java, .NET, PHP, Node.js, Python, Ruby, Go, and Docker on familiar servers such as Apache, Nginx, Passenger, and IIS.

## Before you get started

If you're new to XebiaLabs blueprints, check out:

* [Get started with DevOps as Code](https://docs.xebialabs.com/xl-platform/concept/get-started-with-devops-as-code.html)
* [Get started with blueprints](https://docs.xebialabs.com/xl-platform/concept/get-started-with-blueprints.html)

## Usage

To use this blueprint, run `xl blueprint` and select:

    aws/elastic-beanstalk

## Tools and technologies

This blueprint includes the following tools and technologies:

* Target:
    * [Amazon Elastic Beanstalk](https://aws.amazon.com/elasticbeanstalk/)
* Tools:
    * [XebiaLabs Release Orchestration](https://xebialabs.com/products/xl-release/)
    * [XebiaLabs Deployment Automation](https://xebialabs.com/products/xl-deploy/)

## Minimum required versions

This blueprint version requires at least the following versions of the specified tools to work properly:

XL Release: Version 9.0.0
XL Deploy: Version 9.0.0
XL CLI: Version 9.0.0

## Prerequisites

To run the YAML that this blueprint generates, you need:

* XebiaLabs Release Orchestration and Deployment Automation up and running
* Access to an AWS account to deploy the application to

## Information required

This blueprint requires:

* The application name
* An S3 bucket name
* AWS credentials
* An AWS region

## Output

This blueprint will output:

* Release template
* Infrastructure:
  * Elastic Beanstalk application
* A docker-compose setup for XL Release & XL Deploy

## Tips and tricks

The YAML that the blueprint generates includes optional steps to remove the application and deprovision the cluster.

## Labels

* Cloud
* AWS
* Beanstalk
