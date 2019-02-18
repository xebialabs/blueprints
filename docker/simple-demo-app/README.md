# Local Docker Deployment

## Introduction

Use this blueprint to deploy a Docker application with front-end and back-end services to Docker running locally. The release template that the blueprint generates will deploy the application and optionally undeploy it.

## Before you get started

If you're new to XebiaLabs blueprints, check out:

* [DevOps as Code overview](https://docs.xebialabs.com/xl-platform/concept/devops-as-code-overview.html)
* [Getting started with DevOps as Code](https://docs.xebialabs.com/xl-platform/concept/getting-started-with-devops-as-code.html)
* [Using the XebiaLabs Command-Line Interface (CLI)](https://docs.xebialabs.com/xl-platform/concept/xl-command-line-interface.html)

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
