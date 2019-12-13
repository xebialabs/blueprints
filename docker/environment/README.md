# Docker Environment

## Introduction

Use this blueprint to define an environment for your Docker engine in XL Deploy.

## Before you get started

If you're new to XebiaLabs blueprints, check out:

* [Get started with DevOps as Code](https://docs.xebialabs.com/xl-release/concept/get-started-with-devops-as-code.html)
* [Get started with blueprints](https://docs.xebialabs.com/xl-release/concept/get-started-with-blueprints.html)

## Prerequisites

* XebiaLabs Deployment Automation up and running
* A local Docker installation up and running

## Usage

To use this blueprint, run `xl blueprint` in an empty directory and select:

```plain
docker/environment
```

If you accept the defaults, the environment will refer to a Docker proxy that is running in the same Docker instance as the XL Deploy container. Use the [xl-devops-platform](https://github.com/xebialabs/blueprints/tree/development/xl-devops-platform) blueprint to create a Docker Compose that sets up XL Deploy and the Docker proxy correctly for this functionality to work.

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

## Information required

* The URL for your Docker engine

## Output

* The file `xebialabs/environment.yaml` that defines an XL Deploy environment for your Docker engine.

## Tips and tricks

You can use the `xl-devops-platform` blueprint to generate docker-compose file including XLD and Docker Proxy images.

## Labels

* Docker

