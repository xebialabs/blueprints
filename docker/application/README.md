# Docker Single Container Application

## Introduction

Use this blueprint to define a package that deploys a single Docker container.

## Before you get started

If you're new to XebiaLabs blueprints, check out:

* [Get started with DevOps as Code](https://docs.xebialabs.com/xl-platform/concept/get-started-with-devops-as-code.html)
* [Get started with blueprints](https://docs.xebialabs.com/xl-platform/concept/get-started-with-blueprints.html)
* [Get started with XL JetPack](https://docs.xebialabs.com/xl-platform/concept/get-started-with-xl-jetpack.html)

## Usage

To use this blueprint, run `xl blueprint` and select:

    `docker/application`

If you accept the defaults, a package with a container that runs the [nginx image](https://hub.docker.com/_/nginx) will be defined.

## Tools and technologies

This blueprint includes the following tools and technologies:

* Target:
    * Docker

## Minimum required versions

This blueprint version requires at least the following versions of the specified tools to work properly:

XL Deploy: Version 8.6.1
XL CLI: Version 8.6.0

## Prerequisites

None

## Information required

None

## Output

This blueprint will output:

* The file `xebialabs/docker-application.yaml` that defines a package that deploys a single Docker container.

## Tips and tricks

None

## Labels

* Docker
