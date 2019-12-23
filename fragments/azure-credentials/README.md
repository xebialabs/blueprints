# Azure Credentials

## Introduction

This blueprint can be used by other Azure-based blueprints to collect credentials in a consistent manner.

## Fragment blueprint

This blueprint is a fragment and not meant to run on its own.

## Usage

To use this blueprint, embed a reference to it in your `blueprint.yaml` file:

```yaml
includeAfter:
- blueprint: fragments/azure-credentials
```

## Output

This blueprint outputs nothing and simply makes the following variables available to the calling blueprint:

* Client ID
* Client Secret
* Subscription ID
* Tenant ID

