# Local Docker Deployment

## Introduction

Use this blueprint to deploy a Docker application with front-end and back-end services to Docker running locally. The release template that the blueprint generates will deploy the application and optionally undeploy it.

## Before you get started

If you're new to XebiaLabs blueprints, check out:

* [Get started with DevOps as Code](https://docs.xebialabs.com/xl-platform/concept/get-started-with-devops-as-code.html)
* [Get started with blueprints](https://docs.xebialabs.com/xl-platform/concept/get-started-with-blueprints.html)
* [Get started with XL JetPack](https://docs.xebialabs.com/xl-platform/concept/get-started-with-xl-jetpack.html)

## Usage

To use this blueprint, run `xl blueprint` and select:

    docker/simple-demo-app

## Tools and technologies

This blueprint includes the following tools and technologies:

* Target:
    * [Docker](https://www.docker.com/)
* Tools:
    * [XebiaLabs Release Orchestration](https://xebialabs.com/products/xl-release/)
    * [XebiaLabs Deployment Automation](https://xebialabs.com/products/xl-deploy/)
* Application or framework:
    * [Sample application API component](https://hub.docker.com/r/xebialabsunsupported/rest-o-rant-api)
    * [Sample application web component](https://hub.docker.com/r/xebialabsunsupported/rest-o-rant-web)

## Minimum Required versions

This blueprint version requires at least the below versions of the specified tools to work properly.

XL Release: Version 8.6
XL Deploy: Version 8.6.1
XL CLI: Version 8.6

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

* Sample Docker images
* Release template
* Docker infrastructure

## Tips and tricks

* Before using this blueprint, ensure that you have a front-end and a back-end application service packaged in Docker containers.
* The YAML that the blueprint generates includes optional steps to remove the application.

## Labels

* Docker
