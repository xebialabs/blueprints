# AWS Elastic Beanstalk Sample Application

## Introduction

AWS Elastic Beanstalk is an easy-to-use service for deploying and scaling web applications and services developed with Java, .NET, PHP, Node.js, Python, Ruby, Go, and Docker on familiar servers such as Apache, Nginx, Passenger, and IIS.

## Before you get started

If you're new to XebiaLabs blueprints, check out:

* [Get started with DevOps as Code](https://docs.xebialabs.com/xl-release/concept/get-started-with-devops-as-code.html)
* [Get started with blueprints](https://docs.xebialabs.com/xl-release/concept/get-started-with-blueprints.html)

## Prerequisites

* XebiaLabs Release Orchestration and Deployment Automation up and running
* AWS Access Key and Secret Key for an account that can deploy the application

## Security warning

This blueprint will store your AWS Access Key and Secret Key in plain text in a file called `xebialabs/secrets.xlvals`. This is not production-level secure. If you wish to use a more secure method for dealing with secrets and passwords, refer to the `showcases/dictionaries-and-secret-stores` blueprint for a demonstration that uses CyberArk Conjur or HashiCorp Vault to better store and handle secrets.

## Usage

To use this blueprint, run `xl blueprint` in an empty directory and select:

```plain
aws/elastic-beanstalk
```

## Tools and technologies

This blueprint includes the following tools and technologies:

* Target:
  * [Amazon Elastic Beanstalk](https://aws.amazon.com/elasticbeanstalk/)
* Tools:
  * [XebiaLabs Release Orchestration](https://xebialabs.com/products/xl-release/)
  * [XebiaLabs Deployment Automation](https://xebialabs.com/products/xl-deploy/)

## Minimum required versions

This blueprint version requires at least the following versions of the specified tools to work properly:

* XL Release: Version 9.0
* XL Deploy: Version 9.0
* XL CLI: Version 9.0

## Information required

* AWS Access Key (find it in `~/.aws/credentials`)
* AWS Secret Access Key (find it in `~/.aws/credentials`)
* An AWS region
* An S3 bucket name

## Output

* Release templates
* Infrastructure:
  * Elastic Beanstalk application
* A docker-compose setup for XL Release & XL Deploy

## Labels

* Cloud
* AWS
* Beanstalk

