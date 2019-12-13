# Data Lake Solution on Amazon EC2

## Introduction

AWS offers a sample Data Lake Solution that shows how you can store both structured and unstructured data in a centralized repository on Amazon Elastic Compute Cloud (EC2), which provides resizable compute capacity in the cloud.

Use this blueprint to deploy the sample Data Lake Solution on EC2 using CloudFormation, which defines the infrastructure that will run on EC2. The release template that the blueprint generates will provision an EC2 instance, deploy the Data Lake Solution to it, and optionally tear the instance down.

## Before you get started

If you're new to XebiaLabs blueprints, check out:

* [Get started with DevOps as Code](https://docs.xebialabs.com/xl-release/concept/get-started-with-devops-as-code.html)
* [Get started with blueprints](https://docs.xebialabs.com/xl-release/concept/get-started-with-blueprints.html)

## Prerequisites

* XebiaLabs Release Orchestration and Deployment Automation up and running
* AWS Access Key and Secret Key for an account that can deploy the application
* Email address where Data Lake administrator credentials can be sent

## Usage

To use this blueprint, run `xl blueprint` in an empty directory and select:

```plain
aws/datalake
```

## Tools and technologies

This blueprint includes the following tools and technologies:

* Target:
  * [Amazon Elastic Compute Cloud (EC2)](https://aws.amazon.com/ec2/)
  * [Amazon Simple Storage Service (S3)](https://aws.amazon.com/s3/)
  * [Amazon Elasticsearch Service](https://aws.amazon.com/elasticsearch-service/)
  * [Amazon DynamoDB](https://aws.amazon.com/dynamodb/)
* Tools:
  * [XebiaLabs Release Orchestration](https://xebialabs.com/products/xl-release/)
  * [XebiaLabs Deployment Automation](https://xebialabs.com/products/xl-deploy/)
  * [AWS CloudFormation](https://aws.amazon.com/cloudformation/)
  * [Amazon Cognito](https://aws.amazon.com/cognito/)
  * [AWS Lambda](https://aws.amazon.com/lambda/)
  * [Amazon API Gateway](https://aws.amazon.com/api-gateway/)
* Application or framework:
  * [Data Lake Solution](https://docs.aws.amazon.com/solutions/latest/data-lake-solution/overview.html)

## Minimum required versions

This blueprint version requires at least the following versions of the specified tools to work properly:

* XL Release: Version 9.0.0
* XL Deploy: Version 9.0.0
* XL CLI: Version 9.0.0

## Information required

* AWS Access Key (find it in `~/.aws/credentials`)
* AWS Secret Access Key (find it in `~/.aws/credentials`)
* An AWS region
* An email address for Data Lake administrator credentials

## Output

* Release templates
* Sample Data Lake Solution
* AWS CloudFormation templates
* A docker-compose setup for XL Release & XL Deploy

## Labels

* Cloud
* AWS

