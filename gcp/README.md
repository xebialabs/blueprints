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

### `TF_ADMIN` for Terraform

> **Note:** If you are creating the project using the GUI instead of the commands below, there will be a project number, a project name and a project ID when you initialize the project, and only ID should be exported as `TF_ADMIN` variable.

```plain
export TF_ADMIN=[GCP project ID]
```
