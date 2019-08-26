# Amazon Lambda Function

## Introduction

AWS Lambda lets you run code without provisioning or managing servers. You pay only for the compute time you consume - there is no charge when your code is not running.

Use this blueprint to provision a basic Lambda function using a CloudFormation Stack.


## Before you get started

If you're new to XebiaLabs blueprints, check out:

* [Get started with DevOps as Code](https://docs.xebialabs.com/xl-platform/concept/get-started-with-devops-as-code.html)
* [Get started with blueprints](https://docs.xebialabs.com/xl-platform/concept/get-started-with-blueprints.html)

## Usage

To use this blueprint, run `xl blueprint` and select:

```plain
aws/basic-lambda
```

## Tools and technologies

This blueprint includes the following tools and technologies:

* Tools:
    * [XebiaLabs Release Orchestration](https://xebialabs.com/products/xl-release/)
    * [XebiaLabs Deployment Automation](https://xebialabs.com/products/xl-deploy/)
    * [AWS CloudFormation](https://aws.amazon.com/cloudformation/)
    * [AWS Lambda](https://aws.amazon.com/lambda/)

## Minimum required versions

This blueprint version requires at least the below versions of the specified tools to work properly.

* XL Deploy: Version 9.0.0

## Prerequisites

To run the YAML that this blueprint generates, you need:

* XebiaLabs Release Orchestration and Deployment Automation up and running
* Access to an AWS account to deploy the application to

## Information required

This blueprint requires:

* AWS credentials
* An AWS region

## Output

* Release templates
* AWS CloudFormation template
* Infrastructure:
    * AWS Lambda artifact for the application

## Labels

* Cloud
* AWS
* CloudFormation
* Lambda
