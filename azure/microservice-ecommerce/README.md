# Microservice Application on Azure Kubernetes Service

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

XL Release: Version 9.0.0
XL Deploy: Version 9.0.0
XL CLI: Version 9.0.0

## Prerequisites

To run the YAML that this blueprint generates, you need:

* XebiaLabs Release Orchestration and Deployment Automation up and running
* Access to an Azure account to deploy the application to
* A Jenkins server up and running (only if you want to publish your own Docker images)

## Information required

This blueprint will ask for the following information:

* Azure Service Principal (see step 2.2)
* Azure Resource Group (see step 3.1)
* An Azure region (e.g. `westus`)
* The AKS cluster endpoint if you are deploying to an existing cluster
* Azure Storage Account for the Terraform state if creating a new cluster (see step 3.2)
* Kubernetes cluster credentials
* The Kubernetes namespace

**Important notes:**

* Use the same location/region in all of the follow steps (e.g. `westus`)
* The blueprint will deploy a Jenkins server for you if you want to test out the CI/CD features
  * The default login is: `admin`/`admin`
* You will either use your own existing Kubernetes cluster or have the blueprint create on for you

## Steps

### Step 1: Install the Azure CLI (`az`) binary

Follow [these instructions](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest) to install the Azure CLI on your platform.

#### 1.1: Log in

Run the following command to log in:

```plain
az login
```

Follow the prompts to complete the authentication.

**Note:** You need to have the proper permissions and privileges in the Azure account to execute these commands. If you are using a personal account you should be having these as you will be the admin. If you are using a company/enterprise account please check with your account administrator.

### Step 2: Create a Service Principal and obtain special Azure properties to be used in the blueprint

**Note:** This step is only necessary if you want the blueprint to create a Kubernetes cluster for you.

When you run the blueprint, it will prompt you for the following four Azure properties:

1. `subscription id`
2. `tenant id`
3. `client id`
4. `client secret`

If you are familiar with Azure, you will probably have these values or know how to find them. If not, Step 2 will explain how to create the necessary accounts/objects and obtain these values.

**See:**

* [Application and service principal objects in Azure Active Directory](https://docs.microsoft.com/en-us/azure/active-directory/develop/app-objects-and-service-principals)

#### 2.1 Obtain the `subscription id`

Run the command below to see the list of subscriptions you can access:

```plain
az account list
```

This will output something like:

```json
[
  {
    "cloudName": "AzureCloud",
    "id": "5dses33-f595-3333-6666-77788889997",
    "isDefault": true,
    "name": "Free Trial",
    "state": "Enabled",
    "tenantId": "7f3c634b-3ds4-23fe-8aa7-dme3jdwejqdxv",
    "user": {
      "name": "user@email.com",
      "type": "user"
    }
  }
]
```

In this output:

* `id` is the `subscription id` for the blueprint

Note it down for use in the blueprint and substitute `SUBSCRIPTION_ID` in the next step where you will create a functional user that has privileges to spin up a managed K8s cluster.

#### 2.2: Create the Service Principal and obtain the `tenant id`, `client id` and `client secret`

Run:

```plain
az ad sp create-for-rbac --role="Contributor" --name NAME --scopes="/subscriptions/SUBSCRIPTION_ID"
```

This will output something like this:

```json
{
  "appId": "99999-0000-8888-7777-888877776755",
  "displayName": "azure-cli-2019-04-19-17-32-40",
  "name": "http://azure-cli-2019-04-19-17-32-40",
  "password": "77778888-7788-9998-92fc-huoui89889",
  "tenant": "7f3c634b-3ds4-23fe-8aa7-dme3jdwejqdxv"
}
```

In this output:

* `tenant` is the `tenant id` for the blueprint
* `appId` is the `client id` for the blueprint
* `password` is the `client secret` for the blueprint

Note these down for use in the blueprint.

**See:**

* [Create an Azure service principal](https://docs.microsoft.com/en-us/cli/azure/create-an-azure-service-principal-azure-cli?view=azure-cli-latest)

### Step 3: Set up Terraform's backend storage for creating the Kubernetes cluster

**Note:** This step is only necessary if you want the blueprint to create a Kubernetes cluster for you.

In this step, you will create the necessary storage objects so that Terraform can store its internal state with Azure and keep track of the cluster it will build.

#### 3.1: Create a Resource Group

Run:

```plain
az group create --name RESOURCE_GROUP \
                --location LOCATION
```

**See:**

* [Create a resource group](https://docs.microsoft.com/en-us/cli/azure/group?view=azure-cli-latest#az-group-create)

#### 3.2: Create a Storage Account

Run:

```plain
az storage account create --name STORAGE_ACCOUNT_NAME \
                          --resource-group RESOURCE_GROUP \
                          --location LOCATION \
                          --sku Standard_LRS
```

**See:**

* [Create a storage account](https://docs.microsoft.com/en-us/azure/storage/common/storage-quickstart-create-account?tabs=azure-cli)

#### 3.3: Obtain a key in order to create a Storage Container

Run:

```plain
az storage account keys list --account-name STORAGE_ACCOUNT_NAME
```

This will output something like this:

```json
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

Note one of the account keys down for use in the next step and in the blueprint.

**See:**

* [Storage account keys](https://docs.microsoft.com/en-us/cli/azure/storage/account/keys?view=azure-cli-latest)

#### 3.4: Create a Storage Container

> **Note:** For this step, name the container `terraform-state`, as this is also the default in the blueprint. If you want to give it a different name, remember to use that name when prompted by the blueprint.

Run:

```plain
az storage container create --name terraform-state \
                            --account-key ACCOUNT_KEY \
                            --account-name STORAGE_ACCOUNT_NAME
```

**See:**

* [Create a storage container](https://docs.microsoft.com/en-us/cli/azure/storage/container?view=azure-cli-latest#az-storage-container-create)

### Step 4: Clone the `e-commerce-microservice` repository

**Note:** If you plan to set up the Jenkins CI/CD pipeline, you will first need to fork the XebiaLabs `e-commerce-microservice` repository.

#### 4.1: With Jenkins CI/CD
If you plan to use the Jenkins CI/CD part of the blueprint, first fork the https://github.com/xebialabs/e-commerce-microservice.git repo.

> **Note:** You will use your GitHub username as the `GITHUB_USER` environment variable when deploying in the next stage.

Make sure you clone the https://github.com/$GITHUB_USER/e-commerce-microservice.git (`gke-blueprint` branch) by running:

```plain
git clone -b gke-blueprint https://github.com/$GITHUB_USER/e-commerce-microservice.git
```

#### 4.2: Without Jenkins CI/CD
Make sure you clone the https://github.com/xebialabs/e-commerce-microservice.git (`gke-blueprint` branch) by running:

```plain
git clone -b gke-blueprint https://github.com/xebialabs/e-commerce-microservice.git
```

### Step 5: Run the blueprint

Now `cd` into `e-commerce-microservice` and run `xl blueprint`, then select:

```plain
azure/microservice-ecommerce
```

#### 5.1: Output

The blueprint will output:

* Release templates
* Terraform templates
* Infrastructure:
    * AKS cluster (master, nodes)
    * Security infrastructure
* A docker-compose setup for XL JetPack and Jenkins

**Note:** You will find more instructions in `xebialabs/USAGE.md` after you have run the blueprint.

## Notes

* If you opt to use Jenkins in the release template that this blueprint generates, before you run the `xl apply` command, define a Jenkins server as a shared configuration in XL Release and put its name in the `xlr-pipeline-ci-cd.yaml` file. If you use the provided `docker-compose.yml` file this will be automatically setup for you.
* The YAML that the blueprint generates includes optional steps to remove the application and deprovision the cluster.

## Labels

* Cloud
* Microsoft
* Kubernetes
* Terraform
