# Amazon Web Services

These are notes common to all AWS blueprints.

## AWS CLI

If you want the blueprint to automatically detect your AWS Access Key and AWS Secret Access Key, you'll need to install and configure the CLI.

### Install the CLI

1. Follow [these instructions](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html) for your platform or use your platform's package manager to install the CLI.

2. Make sure the `aws` binary is on your classpath.

3. Run `aws configure` and follow the prompts.

You should now be set up to use the AWS CLI and have the blueprints detect the AWS secrets.
