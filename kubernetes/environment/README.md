# Kubernetes Environment blueprint

## Introduction

Use this blueprint to define an environment for a Kubernetes cluster in XL Deploy based on the information in your [kubeconfig file](https://kubernetes.io/docs/concepts/configuration/organize-cluster-access-kubeconfig/) in `~/.kube/config`.

## Before you get started

If you're new to XebiaLabs blueprints, check out:

* [Get started with DevOps as Code](https://docs.xebialabs.com/xl-release/concept/get-started-with-devops-as-code.html)
* [Get started with blueprints](https://docs.xebialabs.com/xl-release/concept/get-started-with-blueprints.html)

## Usage

To use this blueprint, run `xl blueprint` and select:

    `[kubernetes/environment]`

## Tools and technologies

This blueprint includes the following tools and technologies:

* Target:
    * Kubernetes

## Prerequisites

* A valid [kubeconfig file](https://kubernetes.io/docs/concepts/configuration/organize-cluster-access-kubeconfig/) in `~/.kube/config`.

## Information required

This blueprint requires:

* Nothing. All information will be taken from your `~/.kube/config`.

## Output

This blueprint will output:

* The file `xebialabs/kubernetes-environment.yaml` that defines an XL Deploy infrastructure item and environment for your Kubernetes cluster.

If your `~/.kube/config` contains a reference to `localhost`, it will be replaced with `host.docker.internal` so that the container that runs XL Deploy will access the Kubernetes cluster correctly.

## Tips and tricks

None

## Labels

* `kubernetes`
