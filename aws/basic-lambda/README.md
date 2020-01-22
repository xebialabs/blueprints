# Basic Amazon Lambda Function

## Introduction

AWS Lambda lets you run code without provisioning or managing servers. You pay only for the compute time you consume - there is no charge when your code is not running.

Use this blueprint to provision a basic Lambda function using a CloudFormation Stack.

## Before you get started

If you're new to XebiaLabs blueprints, check out:

* [Get started with DevOps as Code](https://docs.xebialabs.com/xl-release/concept/get-started-with-devops-as-code.html)
* [Get started with blueprints](https://docs.xebialabs.com/xl-release/concept/get-started-with-blueprints.html)

## Prerequisites

* XebiaLabs Deployment Automation up and running
* AWS Access Key and Secret Key for an account that can deploy the application
* See the AWS [README.md](https://github.com/xebialabs/blueprints/blob/master/aws/README.md) for instructions on how to set this up

## Security warning

This blueprint will store your AWS Access Key and Secret Key in plain text in a file called `xebialabs/secrets.xlvals`. This is not production-level secure. If you wish to use a more secure method for dealing with secrets and passwords, refer to the `showcases/dictionaries-and-secret-stores` blueprint for a demonstration that uses CyberArk Conjur or HashiCorp Vault to better store and handle secrets.

## Usage

To use this blueprint, run `xl blueprint` in an empty directory and select:

```plain
aws/basic-lambda
```

## Tools and technologies

This blueprint includes the following tools and technologies:

* Target:
  * [AWS Lambda](https://aws.amazon.com/lambda/)
* Tools:
  * [XebiaLabs Release Orchestration](https://xebialabs.com/products/xl-release/)
  * [XebiaLabs Deployment Automation](https://xebialabs.com/products/xl-deploy/)
  * [AWS CloudFormation](https://aws.amazon.com/cloudformation/)
  * [AWS Lambda](https://aws.amazon.com/lambda/)

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
  * AWS Lambda artifact for the application

## Labels

* Cloud
* AWS
* CloudFormation
* Lambda

