# XebiaLabs Blueprints

Blueprint definitions for xl-cli. These files will be synced to [https://s3.amazonaws.com/xl-cli/blueprints](https://s3.amazonaws.com/xl-cli/blueprints) and can be used as xl-cli blueprint repository (set by default).

## Adding new blueprint

Simply create a folder and add required files & templates along with a local `index.json` file. Finally, update root `index.json` file to include the newly created folder.

## Publish

Any changes that are dependent on a new XL CLI version should be done only on the development branch. Master branch should only contain published changes. Development branch needs to be synced to master during every official XL-CLI release

The official blueprints are hosted on our distribution site and are published using the internal [Jenkins Job](https://jenkins-ng.xebialabs.com/jenkinsng/job/XL%20Devops%20As%20Code/job/Blueprints%20Release/) which is triggered manually.

Run `publish.py` script to update the S3 bucket for development.

### Prerequisites

- python & pip is needed for the publish script
- For updating S3 bucket, you'll need to generate your local AWS credentials file as described [here](https://docs.aws.amazon.com/cli/latest/userguide/cli-config-files.html).
- For using S3 API, you need to install `boto3` library using `pip install boto3` command
