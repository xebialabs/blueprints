# Azure basic AKS cluster XLR pipeline for Azure basic AKS cluster in XLD

> **WARNING:** This is not a standalone blueprint. It must be used in conjunction with the following:
>
> * `azure/basic-aks-cluster` OR `gcp/basic-gke-cluster`
> * `kubernetes/application`

## What this blueprint does

This blueprint orchestrates the above blueprints (which only use XLD) by adding an XLR pipeline to:
* provision the cluster
* deploy the application
* test the application
* undeploy the application and deprovision the cluster

## How to use this blueprint

1. Instantiate an instance of XLD and XLR using the `xl-devops-platform` blueprint
2. Choose a platform (AKS or GKE) and apply it to the above platform
3. Apply the `kubernetes/application` blueprint to the above platform
4. Apply this blueprint to the above platform
5. In XLR, find the template you created and start a deployment
