# Docker Environment

## Introduction

Use this blueprint to define an environment for your Docker engine in XL Deploy.

## Before you get started

If you're new to XebiaLabs blueprints, check out:

* [Get started with DevOps as Code](https://docs.xebialabs.com/xl-platform/concept/get-started-with-devops-as-code.html)
* [Get started with blueprints](https://docs.xebialabs.com/xl-platform/concept/get-started-with-blueprints.html)
* [Get started with XL JetPack](https://docs.xebialabs.com/xl-platform/concept/get-started-with-xl-jetpack.html)

## Usage

To use this blueprint, run `xl blueprint` and select:

    `docker/environment`

If you accept the defaults, the environment will refer to a Docker proxy that is running in the same Docker instance as the XL Deploy container. Use the [xl-devops-platform](https://github.com/xebialabs/blueprints/tree/development/xl-devops-platform) blueprint to create a Docker Compose that sets up XL Deploy and the Docker proxy correctly for this functionality to work.

## Tools and technologies

This blueprint includes the following tools and technologies:

* Target:
    * Docker

## Prerequisites

This blueprint requires:

* A running Docker engine

## Information required

This blueprint requires:

* The URL for your Docker engine

## Output

This blueprint will output:

* The file `xebialabs/docker-infrastructure.yaml` that defines the XL Deploy infrastructure item for your Docker engine.
* The file `xebialabs/docker-environment.yaml` that defines an XL Deploy environment for your Docker engine.

## Tips and tricks

None

## Labels

* Docker
