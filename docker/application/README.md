# Blueprint Name

## Introduction

Use this blueprint to define a package that deploys a single Docker container

## Before you get started

If you're new to XebiaLabs blueprints, check out:

* [Get started with DevOps as Code](https://docs.xebialabs.com/xl-platform/concept/get-started-with-devops-as-code.html)
* [Get started with blueprints](https://docs.xebialabs.com/xl-platform/concept/get-started-with-blueprints.html)

## Usage

To use this blueprint, run `xl blueprint` and select:

    `[docker/application]`

If you accept the defaults, a package with a container that runs the [nginx image](https://hub.docker.com/_/nginx) will be defined.

## Tools and technologies

This blueprint includes the following tools and technologies:

* Target:
    * Docker

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

* `docker`

