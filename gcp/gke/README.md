# XL Blueprint for creating K8 Clusters (GKE) in GCP
Use this blueprint to provision a K8 cluster in the Google Cloud (GCP)

## Before you get started
If you're new to XebiaLabs blueprints, check out:

* [Get started with DevOps as Code](https://docs.xebialabs.com/xl-platform/concept/get-started-with-devops-as-code.html)
* [Get started with blueprints](https://docs.xebialabs.com/xl-platform/concept/get-started-with-blueprints.html)
* [Get started with XL JetPack](https://docs.xebialabs.com/xl-platform/concept/get-started-with-xl-jetpack.html)

## Prerequisites
### Authenticate to gcloud
Before configuring gcloud CLI you can check available Zones and Regions nearest to your location

```sh
gcloud compute regions list

gcloud compute zones list
```

Follow gcloud init and select default Zone Ex. europe-west1. Make sure you use this same zone during blueprint execution.

```sh
gcloud init
```

### Creating Google Cloud project and service account for terraform

The best practice is to use a separate "technical account" to manage infrastructure. This account can be used in automated code deployment like in Terraform or XL-Deploy or any other tool you choose.

> NOTE: You need to have proper permissions and privileges in the GCP account to execute these commands. If you are using a personal account, you will need administrative privileges. If you are using a company/enterprise account, please check with your account administrator. 

#### Set up your environment

> NOTE: If you are creating the Project via GUI instead of the below commands, there will be a project number, a project name and a project ID when you initialize the project. Export the project ID as `TF_ADMIN` variable.

```sh
export TF_ADMIN=[GCP project ID]
```

#### Create the GCP Project

Create a new project and link it to your billing account (you could do it from the GCP console GUI as well, in that case skip the below command)

> NOTE: The value of YOUR_ORG_ID and YOUR_BILLING_ACCOUNT_ID can be found by running below commands

```sh
gcloud organizations list

gcloud beta billing accounts list
```

Once you have the details run the below commands

```sh
gcloud projects create ${TF_ADMIN} \
--organization [YOUR_ORG_ID] \
--set-as-default

gcloud beta billing projects link ${TF_ADMIN} \
--billing-account [YOUR_BILLING_ACCOUNT_ID]
```

#### Create the Terraform service account

Create the service account in the GCP project and download the JSON credentials(This will be needed later for the blueprints):

```sh
gcloud iam service-accounts create terraform \
--display-name "Terraform admin account"

gcloud iam service-accounts keys create account.json \
--iam-account terraform@${TF_ADMIN}.iam.gserviceaccount.com
```

Grant the service account permission to view the Admin Project and manage Cloud Storage

```sh
gcloud projects add-iam-policy-binding ${TF_ADMIN} \
--member serviceAccount:terraform@${TF_ADMIN}.iam.gserviceaccount.com \
 --role roles/viewer
 
gcloud projects add-iam-policy-binding ${TF_ADMIN} \
--member serviceAccount:terraform@${TF_ADMIN}.iam.gserviceaccount.com \
 --role roles/storage.admin
  
gcloud projects add-iam-policy-binding ${TF_ADMIN} \
--member serviceAccount:terraform@${TF_ADMIN}.iam.gserviceaccount.com \
 --role roles/compute.admin
  
gcloud projects add-iam-policy-binding ${TF_ADMIN} \
--member serviceAccount:terraform@${TF_ADMIN}.iam.gserviceaccount.com \
 --role roles/compute.networkAdmin
  
gcloud projects add-iam-policy-binding ${TF_ADMIN} \
--member serviceAccount:terraform@${TF_ADMIN}.iam.gserviceaccount.com \
 --role roles/container.admin
  
gcloud projects add-iam-policy-binding ${TF_ADMIN} \
--member serviceAccount:terraform@${TF_ADMIN}.iam.gserviceaccount.com \
 --role roles/container.clusterAdmin

gcloud projects add-iam-policy-binding ${TF_ADMIN} \
--member serviceAccount:terraform@${TF_ADMIN}.iam.gserviceaccount.com \
 --role roles/iam.serviceAccountUser
```

Enable APIs for the newly created project

```sh
gcloud services enable cloudresourcemanager.googleapis.com \
    cloudbilling.googleapis.com \
    iam.googleapis.com \
    compute.googleapis.com \
    container.googleapis.com
```

## Creating back-end storage for the `tfstate` file in Cloud Storage

Terraform stores the infrastructure and configuration state by default in a local file `terraform.tfstate`. State is used by Terraform to map resources to configuration and to track metadata.

The state file may be stored remotely, which works better for team environments or automated deployments.  We will use Google Storage and create new bucket where we can store state files.

Create the remote back-end bucket in Cloud Storage for storage of the `terraform.tfstate` file.
Make sure you use the same zone as the one selected during blueprint execution in above command.

```sh
gsutil mb -p ${TF_ADMIN} -l europe-west1 gs://${TF_ADMIN}
```

Enable versioning for said remote bucket:

```sh
gsutil versioning set on gs://${TF_ADMIN}
```

## Usage

To use this blueprint, run `xl blueprint` and select:

    gcp/gke

To deploy this blueprint, read the usage instruction in the `USAGE.md` amongst the generated files.

## Minimum required versions

This blueprint version requires at least the below versions of the specified tools to work properly.

- XL Release: Version 8.6.1
- XL Deploy: Version 8.6.1
- XL CLI: Version 8.6
