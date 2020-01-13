# Microsoft Azure

These are notes common to all Azure blueprints.

All the Azure blueprints require the following information:

* Azure credentials
  * Client ID
  * Client secret (password)
  * Subscription ID
  * Tenant ID
* Resource group
* Geographic Location

## Azure CLI

The Azure CLI is not strictly necessary for running the blueprints, but is very useful for obtaining the credentials and creating certain resources.

### Install the CLI

Follow [these instructions](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest) to install the Azure CLI on your platform.

### Log in

Run the following command to log in:

```plain
az login
```

Follow the prompts to complete the authentication.

> **Note:** You need to have the proper permissions and privileges in your Azure account to execute these commands. If you are using a personal account you should be having these as you will be the admin. If you are using a company/enterprise account please check with your account administrator.

## Create a Service Principal and obtain the Azure credentials to be used in the blueprints

When you run a blueprint, it may prompt you for the following four Azure properties:

1. `client id`
2. `client secret`
3. `subscription id`
4. `tenant id`

> **Note:** If you are familiar with Azure, you may already have these values or know how to find them. If not, or if you are new to Azure, the following steps will explain how to create the necessary accounts/objects to obtain these values.

**See:**

* [Application and service principal objects in Azure Active Directory](https://docs.microsoft.com/en-us/azure/active-directory/develop/app-objects-and-service-principals)

### Obtain the `subscription id` and `tenant id`

Run the following command to see the list of subscriptions you can access:

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

* `id` is the `subscription_id` for the blueprints
* `tenantId` is the `tenant_id` for the blueprints

Note these down and substitute `SUBSCRIPTION_ID` in the following steps where you will create a functional user that has privileges to spin up a managed K8s cluster.

### Create the Service Principal and obtain the `client id` and `client secret`

Run the following command to create the Service Principal:

```plain
az ad sp create-for-rbac --role="Contributor"
                         --name YOURNAME
                         --scopes="/subscriptions/SUBSCRIPTION_ID"
```

This will output something like:

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

* `appId` is the `client_id` for the blueprints
* `password` is the `client_secret` for the blueprints

Note these down. You now have all four values to run Azure blueprints.

**See:**

* [Create an Azure service principal](https://docs.microsoft.com/en-us/cli/azure/create-an-azure-service-principal-azure-cli?view=azure-cli-latest)


## Set up Terraform's backend storage for creating a Kubernetes cluster

In this step, you will create the necessary storage objects so that Terraform can store its internal state with Azure and keep track of the cluster it will build.

> **Note:** These step are only necessary if:
>
> * This blueprint needs a Kubernetes cluster
> * You want the blueprint to create a new cluster for you

### Create a Resource Group to house the storage

> **Note:** While each blueprint prompts you for a Resource Group to house its resources, you will need a separate Resource Group for storage.

Run the following command to create the Resource Group:

```plain
az group create --name RESOURCE_GROUP
                --location LOCATION
```

**See:**

* [Create a resource group](https://docs.microsoft.com/en-us/cli/azure/group?view=azure-cli-latest#az-group-create)

### Create a Storage Account

Run:

```plain
az storage account create --name STORAGE_ACCOUNT_NAME \
                          --resource-group RESOURCE_GROUP \
                          --location LOCATION \
                          --sku Standard_LRS
```

**See:**

* [Create a storage account](https://docs.microsoft.com/en-us/azure/storage/common/storage-quickstart-create-account?tabs=azure-cli)

### Obtain a key in order to create a Storage Container

Run:

```plain
az storage account keys list --account-name STORAGE_ACCOUNT_NAME
```

This will output something like:

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

### Create a Storage Container

> **Note:** For this step, name the container `terraform-state`, as this is also the default in the blueprint. If you want to give it a different name, remember to use that name when prompted by the blueprint.

Run:

```plain
az storage container create --name terraform-state
                            --account-key ACCOUNT_KEY
                            --account-name STORAGE_ACCOUNT_NAME
```

**See:**

* [Create a storage container](https://docs.microsoft.com/en-us/cli/azure/storage/container?view=azure-cli-latest#az-storage-container-create)
