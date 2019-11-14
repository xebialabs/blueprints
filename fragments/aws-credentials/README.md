# AWS Credentials

## Introduction

This blueprint can be used by other AWS-based blueprints to collect credentials in a consistent manner.

## Fragment blueprint

This blueprint is a fragment and not meant to run on its own.

## Usage

To use this blueprint, embed a reference to it in your `blueprint.yaml` file:

```yaml
includeAfter:
- blueprint: fragments/aws-credentials
```

## Output

This outputs nothing and simply makes the following variables available to the calling blueprint:

* AWSAccessKey
* AWSAccessSecret
