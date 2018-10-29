# XebiaLabs Blueprints

Blueprint definitions for xl-cli. These files will be synced to [https://s3.amazonaws.com/xl-cli/blueprints](https://s3.amazonaws.com/xl-cli/blueprints) and can be used as xl-cli blueprint repository (set by default).

## Adding new blueprint

Simply create a folder and add required files & templates along with a local `index.json` file. Finally, update root `index.json` file to include the newly created folder.

## Publish

Run `publish.py` script to update official S3 bucket.

### Prerequisites

- python & pip is needed for the publish script
- For updating S3 bucket, you'll need to generate your local AWS credentials file as described [here](https://docs.aws.amazon.com/cli/latest/userguide/cli-config-files.html).
- For using S3 API, you need to install `boto3` library using `pip install boto3` command