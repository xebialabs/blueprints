# Kubernetes Application blueprint

## Introduction

Use this blueprint to define a package that deploys a single Kubernetes YAML or JSON file

## Before you get started

If you're new to XebiaLabs blueprints, check out:

* [Get started with DevOps as Code](https://docs.xebialabs.com/xl-release/concept/get-started-with-devops-as-code.html)
* [Get started with blueprints](https://docs.xebialabs.com/xl-release/concept/get-started-with-blueprints.html)

## Usage

To use this blueprint, run `xl blueprint` and select:

    `[kubernetes/application]`

If you accept the defaults, a package with a simple [nginx deployment](https://kubernetes.io/docs/tasks/run-application/run-stateless-application-deployment/#creating-and-exploring-an-nginx-deployment) will be defined.

## Tools and technologies

This blueprint includes the following tools and technologies:

* Target:
    * Kubernetes

## Prerequisites

None

## Information required

None

## Output

This blueprint will output:

* The file `xebialabs/application.yaml` that defines a package that deploys a single Docker container.

## Tips and tricks

None

## Labels

* `kubernetes`

