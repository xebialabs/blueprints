# Blueprint Name

## Introduction

Use this blueprint to define an environment for your Docker engine in XL Deploy.


## Before you get started

If you're new to XebiaLabs blueprints, check out:

* [Get started with DevOps as Code](https://docs.xebialabs.com/xl-platform/concept/get-started-with-devops-as-code.html)
* [Get started with blueprints](https://docs.xebialabs.com/xl-platform/concept/get-started-with-blueprints.html)

## Usage

To use this blueprint, run `xl blueprint` and select:

    `[docker/environment]`

## Tools and technologies

This blueprint includes the following tools and technologies:

* Target:
    * Docker

## Prerequisites

None

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

* `docker`
