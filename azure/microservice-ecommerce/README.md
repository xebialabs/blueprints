# Microservice Application on Google Kubernetes Engine

## Introduction

Azure Kubernetes Service (AKS) allows you to deploy, manage, and scale containerized applications in the cloud using Kubernetes.

Use this blueprint to deploy a sample microservice-based application on AKS using Terraform, which defines the infrastructure that will run on AKS. The release template that the blueprint generates connects to an existing AKS cluster or provisions a new cluster and deploys a sample application to it.

## Before you get started

If you're new to XebiaLabs blueprints, check out:

* [Get started with DevOps as Code](https://docs.xebialabs.com/xl-platform/concept/get-started-with-devops-as-code.html)
* [Get started with blueprints](https://docs.xebialabs.com/xl-platform/concept/get-started-with-blueprints.html)
* [Get started with XL JetPack](https://docs.xebialabs.com/xl-platform/concept/get-started-with-xl-jetpack.html)

## Tools and technologies

This blueprint includes the following tools and technologies:

* Target:
    * [Azure Kubernetes Service (AKS)](https://azure.microsoft.com/en-us/services/kubernetes-service/)
* Tools:
    * [XebiaLabs Release Orchestration](https://xebialabs.com/products/xl-release/)
    * [XebiaLabs Deployment Automation](https://xebialabs.com/products/xl-deploy/)
    * [Jenkins](https://jenkins.io/)
    * [Kubernetes](https://kubernetes.io/)
    * [Terraform](https://www.terraform.io/)
* Application or framework:
    * [JHipster](https://github.com/xebialabs/e-commerce-microservice/)

## Minimum Required versions

This blueprint version requires at least the below versions of the specified tools to work properly.

XL Release: Version 8.6
XL Deploy: Version 8.6.1
XL CLI: Version 8.6

## Prerequisites

To run the YAML that this blueprint generates, you need:

* XebiaLabs Release Orchestration and Deployment Automation up and running
* Access to an Azure account account to deploy the application to
* A Jenkins server up and running (only if you want to publish your own Docker images)

## Information required

This blueprint requires:

* Azure Service Principal (see section below for instructions)
* Azure Resource Group (see section below for instructions)
* An Azure region
* The AKS cluster endpoint (if deploying to an existing cluster)
* Azure Storage Account for the Terraform state if creating a new cluster (see section below for instructions)
* Kubernetes cluster credentials
* The Kubernetes namespace
* Jenkins credentials (if enabling CI integration)

## Steps

### Step 1: Install the Azure CLI (`az`) binary

> **Follow these instructions to install the Azure CLI on your platform:**
>
> * https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest

> **Note:** All examples below use the CLI

### Step 2: Log into Azure

```plain
az login
```

Follow the prompts to log in

> **Note:** You need to have proper permissions and privileges in the Azure account to execute these commands. If you are using a personal account you should be having these as you will be the admin. If you are using a company/enterprise account please check with your account administrator.

### Step 3: Set up the environment

> **Please take note of the following:**
>
> * You need an existing **Service Principal** in order for the blueprint to create resources
> * You will need a **Resource Group** in order to create the **Storage Account** if you need to store Terraform state
> * If you are creating a new Kubernetes cluster, the blueprint will create a **new Resource Group** to hold that cluster

> **Important:** Running `terraform destroy` will completely remove the **new Resource Group** you specify in the blueprint (and all resources associated with it). So don't give the name of an existing Resource Group unless you're willing to lose it.

#### 3.1 Create a Service Principal

If you don't already have a Service Principal, create one using the GUI or the CLI:

> **See:**
>
> * [**GUI:** How to: Use the portal to create an Azure AD application and service principal that can access resources](https://docs.microsoft.com/en-us/azure/active-directory/develop/howto-create-service-principal-portal)
> * [**CLI:** Create an Azure service principal with Azure CLI](https://docs.microsoft.com/en-us/cli/azure/create-an-azure-service-principal-azure-cli?view=azure-cli-latest)

> **Note:** Regardless of how you create the Service Principal, take note of the fields `appId`, `password` and `tenant`; you will be asked for it by the blueprint

#### 3.2 Create a Resource Group for the Storage Account

> **See:**
>
> * [**CLI:** az group create](https://docs.microsoft.com/en-us/cli/azure/group?view=azure-cli-latest#az-group-create)

This will be the Resource Group for the Terraform state. It should **NOT** be the same as the Resource Group specified in the blueprint.

Example:
```plain
az group create --name RESOURCE_GROUP \
                --location LOCATION
```

#### 3.3 Create a Storage Account to store the Terraform state

> **Note:** This step is only necessary if you want the blueprint to create the Kubernetes cluster for you

If you don't already have a Storage account, create one using the GUI or the CLI:

> **See:**
>
> * [**GUI:** Create a storage account](https://docs.microsoft.com/en-us/azure/storage/common/storage-quickstart-create-account?tabs=azure-portal)
> * [**CLI:** Create a storage account](https://docs.microsoft.com/en-us/azure/storage/common/storage-quickstart-create-account?tabs=azure-cli)
> * [Documentation and syntax](https://docs.microsoft.com/en-us/cli/azure/storage/account?view=azure-cli-latest#az-storage-account-create)

Example:
```plain
az storage account create --name ACCOUNT_NAME \
                          --resource-group EXISTING_RESOURCE_GROUP \
                          --location LOCATION \
                          --sku Standard_LRS \
                          --subscription SUBSCRIPTION_ID
```

> **Note:** Make sure the `location` you choose for the Storage Account is the same as the one you will use in the blueprint and the one you used to create the Resource Group
> **Note:** Take note of the name you give the Storage Account; you will be asked for it by the blueprint

##### 3.3.1 Get the Storage account keys in order to create the Storage Container

> **See:**
>
> * [CLI: az storage account keys](https://docs.microsoft.com/en-us/cli/azure/storage/account/keys?view=azure-cli-latest)

Example
```plain
az storage account keys list --account-name ACCOUNT_NAME
[
  {
    "keyName": "key1",
    "permissions": "Full",
    "value": "abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmn=="
  },
  {
    "keyName": "key2",
    "permissions": "Full",
    "value": "abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmn=="
  }
]
```

> **Note:** Copy one of the key `value`s to use in creating the Storage Container

##### 3.3.2 Create a Storage Container (if you don't already have one)

> [**CLI:** azure storage container create](https://docs.microsoft.com/en-us/cli/azure/storage/container?view=azure-cli-latest#az-storage-container-create)

Example:
```plain
az storage container create --name terraform-state \
                            --account-key ACCOUNT_KEY \
                            --account-name ACCOUNT_NAME
```

### Step 4: Clone the `e-commerce-microservice` repository

#### 4.1 With Jenkins CI/CD
If you plan to use the Jenkins CI/CD part of the blueprint, first fork the https://github.com/xebialabs/e-commerce-microservice.git repo.

> **Note:** You will use your GitHub username as the `GITHUB_USER` environment variable when deploying in the next stage.

Make sure you have cloned the https://github.com/$GITHUB_USER/e-commerce-microservice.git (`gke-blueprint` branch) by running:

```plain
git clone -b gke-blueprint https://github.com/$GITHUB_USER/e-commerce-microservice.git
```

#### 4.2 Without Jenkins CI/CD
Make sure you have cloned the https://github.com/xebialabs/e-commerce-microservice.git (`gke-blueprint` branch) by running:

```plain
git clone -b gke-blueprint https://github.com/xebialabs/e-commerce-microservice.git
```

### Step 5: Run the blueprint

Now `cd` into `e-commerce-microservice` and run `xl blueprint`, then select:

```plain
azure/microservice-ecommerce
```

#### 5.1 Output

The blueprint will output:

* Release templates
* Terraform templates
* Infrastructure:
    * AKS cluster (master, nodes)
    * Security infrastructure
* A docker-compose setup for XL JetPack and Jenkins

> **Note:** You will find more instructions in `xebialabs/USAGE.md` after you have run the blueprint

## Notes

* If you opt to use Jenkins in the release template that this blueprint generates, before you run the `xl apply` command, define a Jenkins server as a shared configuration in XL Release and put its name in the `xlr-pipeline-ci-cd.yaml` file. If you use the provided `docker-compose.yml` file this will be automatically setup for you.
* The YAML that the blueprint generates includes optional steps to remove the application and deprovision the cluster.

## Labels

* Cloud
* Microsoft
* Kubernetes
* Terraform
