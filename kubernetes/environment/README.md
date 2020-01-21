# Kubernetes Environment Blueprint

## Introduction

Use this blueprint to define an environment for a Kubernetes cluster in XL Deploy based on the information in your [kubeconfig file](https://kubernetes.io/docs/concepts/configuration/organize-cluster-access-kubeconfig/) in `~/.kube/config`.

## Before you get started

If you're new to XebiaLabs blueprints, check out:

* [Get started with DevOps as Code](https://docs.xebialabs.com/xl-release/concept/get-started-with-devops-as-code.html)
* [Get started with blueprints](https://docs.xebialabs.com/xl-release/concept/get-started-with-blueprints.html)

## Prerequisites

* XebiaLabs Deployment Automation up and running

## Security warning

This blueprint will store the Kubernetes client certificate and private key in a file called `xebialabs/secrets.xlvals`. This is not production-level secure. If you wish to use a more secure method for dealing with secrets and passwords, refer to the `showcases/dictionaries-and-secret-stores` blueprint for a demonstration that uses CyberArk Conjur or HashiCorp Vault to better store and handle secrets.

## Usage

To use this blueprint, run `xl blueprint` in an empty directory and select:

```plain
kubernetes/environment
```

## Tools and technologies

This blueprint includes the following tools and technologies:

* Target:
  * Kubernetes

## Prerequisites

* XebiaLabs Release Orchestration and Deployment Automation up and running
* * A valid [kubeconfig file](https://kubernetes.io/docs/concepts/configuration/organize-cluster-access-kubeconfig/) in `~/.kube/config`.

## Information required

* Nothing. All information will be taken from your `~/.kube/config`.

## Output

* Release templates

> **Note:** If your `~/.kube/config` contains a reference to `localhost`, it will be replaced with `host.docker.internal` so that the container that runs XL Deploy will access the Kubernetes cluster correctly.

## Labels

* Kubernetes

