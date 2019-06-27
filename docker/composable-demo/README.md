# Composed Docker Deployment

## Introduction

Use this blueprint to deploy a simple Docker application to Docker running locally.

## Before you get started

If you're new to XebiaLabs blueprints, check out:

* [Get started with DevOps as Code](https://docs.xebialabs.com/xl-platform/concept/get-started-with-devops-as-code.html)
* [Get started with blueprints](https://docs.xebialabs.com/xl-platform/concept/get-started-with-blueprints.html)
* [Get started with XL JetPack](https://docs.xebialabs.com/xl-platform/concept/get-started-with-xl-jetpack.html)

## Usage

To use this blueprint, run `xl blueprint` and select:

    docker/composable-demo

## Tools and technologies

This blueprint includes the following tools and technologies:

* Target:
    * [Docker](https://www.docker.com/)
* Tools:
    * [XebiaLabs Deployment Automation](https://xebialabs.com/products/xl-deploy/)

## Minimum required versions

This blueprint version requires at least the following versions of the specified tools to work properly:

XL Deploy: Version 9.0.0
XL CLI: Version 9.0.0

## Prerequisites

To run the YAML that this blueprint generates, you need:

* XebiaLabs Release Orchestration and Deployment Automation up and running
* A local Docker installation up and running

## Information required

This blueprint requires:

* The application name
* The port where the application should be exposed
* Docker images for a front-end and back-end service

## Output

This blueprint will output:

* Docker infrastructure
* Docker application definition

## Labels

* Docker
