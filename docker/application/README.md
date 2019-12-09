# Docker Single Container Application

## Introduction

Use this blueprint to define a package that deploys a single Docker container.

## Before you get started

If you're new to XebiaLabs blueprints, check out:

* [Get started with DevOps as Code](https://docs.xebialabs.com/xl-release/concept/get-started-with-devops-as-code.html)
* [Get started with blueprints](https://docs.xebialabs.com/xl-release/concept/get-started-with-blueprints.html)

## Usage

To use this blueprint, run `xl blueprint` in an empty directory and select:

```plain
docker/application
```

## Tools and technologies

This blueprint includes the following tools and technologies:

* Target:
  * [Docker](https://www.docker.com/)
* Tools:
  * [XebiaLabs Deployment Automation](https://xebialabs.com/products/xl-deploy/)

## Minimum required versions

This blueprint version requires at least the following versions of the specified tools to work properly:

* XL Deploy: Version 9.0.0
* XL CLI: Version 9.0.0

## Prerequisites

* XebiaLabs Release Orchestration and Deployment Automation up and running
* A local Docker installation up and running

## Information required

* The application name
* The port where the application should be exposed
* Docker image for a front-end service

## Output

* The file `xebialabs/application.yaml` that defines a package that deploys a single Docker container.

## Labels

* Docker

