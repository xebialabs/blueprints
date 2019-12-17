# Google Cloud Platform

These are notes common to all GCP blueprints.

## Google Cloud SDK

### Install the CLI

Follow [these instructions](https://cloud.google.com/sdk/install) to install the Google Cloud Platform SDK on your platform.

### Log in

Run the following command to log in:

```plain
gcloud auth login
```

Follow the prompts to complete the authentication.

## Create a Google Cloud project

Create a new project and link it to your billing account (You could do it from the GCP console GUI as well, in that case skip the below command)

> **Note:** First, retrieve the values of YOUR_ORG_ID and YOUR_BILLING_ACCOUNT_ID by executing the following commands:

```plain
gcloud organizations list

gcloud beta billing accounts list
```

Once you have the details run the following commands:

```plain
gcloud projects create [PROJECT_NAME] \
--organization [YOUR_ORG_ID] \

gcloud beta billing projects link [PROJECT_NAME] \
--billing-account [YOUR_BILLING_ACCOUNT_ID]
```

> **Note:** If you are not the admin of a GCP account, ask your administrator to create and link the project for you.


### Set the project

Run the following command to set your project:

```plain
gcloud config set project PROJECT_NAME
```

### Initiate gcloud

Before running the `gcloud init` command, check for available zones and regions nearest to your location by running:

```plain
gcloud compute regions list

gcloud compute zones list
```

Run the following command and select a default zone (e.g. `europe-west1`). Make sure you use the same zone as the one you intend to use with blueprints.

```plain
gcloud init
```

### Creating Google Cloud project and service account for terraform

Best practice to use separate account "technical account" to manage infrastructure, this account can be used in automated code deployment like in Terraform or XL-Deploy or any other tool you may choose.

> NOTE: You need to have proper permissions and privileges in the GCP account to execute these commands. If you are using a personal account you should be having these as you will be the admin. If you are using a company/enterprise account please check with your account administrator.

#### Set up environment

> NOTE: If you are creating the Project via GUI instead of below commands, there will be a project number, a project name and a project ID when you initialize the project, and only ID should be exported as `TF_ADMIN` variable.

```plain
export TF_ADMIN=[GCP project ID]
```

#### Create the GCP Project

Create a new project and link it to your billing account (You could do it from the GCP console GUI as well, in that case skip the below command)

> NOTE: The value of YOUR_ORG_ID and YOUR_BILLING_ACCOUNT_ID can be found by running below commands

```plain
gcloud organizations list

gcloud beta billing accounts list
```

Once you have the details run the below commands

```plain
gcloud projects create ${TF_ADMIN} \
--organization [YOUR_ORG_ID] \
--set-as-default

gcloud beta billing projects link ${TF_ADMIN} \
--billing-account [YOUR_BILLING_ACCOUNT_ID]
```

#### Create the Terraform service account

Create the service account in the GCP project and download the JSON credentials (This will be needed later for the blueprints):

```plain
gcloud iam service-accounts create terraform \
--display-name "Terraform admin account"

gcloud iam service-accounts keys create account.json \
--iam-account terraform@${TF_ADMIN}.iam.gserviceaccount.com
```

> **Note:** Store `account.json` somewhere safe. You'll need it to deploy blueprints to GCP

Grant the service account permission to view the Admin Project and manage Cloud Storage

```plain
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

```plain
gcloud services enable cloudresourcemanager.googleapis.com \
    cloudbilling.googleapis.com \
    iam.googleapis.com \
    compute.googleapis.com \
    container.googleapis.com
```

## Creating back-end storage to store the `tfstate` file in Cloud Storage

Terraform stores the state about infrastructure and configuration by default in a local file `terraform.tfstate`. State is used by Terraform to map resources to configuration and to track metadata.

Terraform allows state file to be stored remotely, which works better in a team environment or automated deployments.
We will use Google Storage and create new bucket where we can store state files.

Create the remote back-end bucket in Cloud Storage for storage of the `terraform.tfstate` file.
Make sure you use the same zone as the one selected during blueprint execution in above command.

```plain
gsutil mb -p ${TF_ADMIN} -l europe-west1 gs://${TF_ADMIN}
```

Enable versioning for said remote bucket:

```plain
gsutil versioning set on gs://${TF_ADMIN}
```

### `TF_ADMIN` for Terraform

> **Note:** If you are creating the project using the GUI instead of the commands below, there will be a project number, a project name and a project ID when you initialize the project, and only ID should be exported as `TF_ADMIN` variable.

```plain
export TF_ADMIN=[GCP project ID]
```
