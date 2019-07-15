# Basic composability demo with EKS/AKS/GKE cluster, Kubernetes application and an XLR pipeline

> **WARNING:** This is not a standalone blueprint. It must be used in conjunction with the following:
>
> * `aws/basic-eks-cluster` OR `azure/basic-aks-cluster` OR `gcp/basic-gke-cluster`
> * `kubernetes/application`

## What this blueprint does

This blueprint orchestrates the above blueprints (which only use XLD) by adding an XLR pipeline to:
* provision the cluster
* deploy the application
* test the application
* undeploy the application and deprovision the cluster

## How to use this blueprint

1. Instantiate this blueprint and select a platform(AKS, EKS or GKE).
1. Provide answers for the questions asked.
1. Start an instance of XLD and XLR using the `xl-devops-platform` blueprint generated in the docker directory.
1. Apply this blueprint to the above platform.
1. In XLR, find the template you created and start a deployment.
