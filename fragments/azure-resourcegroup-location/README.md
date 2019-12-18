# Azure Resource Group and Location

## Introduction

This blueprint can be used by other Azure-based blueprints to collect the name of the Resource Group and it geographic location.

## Fragment blueprint

This blueprint is a fragment and not meant to run on its own.

## Usage

To use this blueprint, embed a reference to it in your `blueprint.yaml` file:

```yaml
includeAfter:
- blueprint: fragments/azure-resourcegroup-location
```

### Prompts

You can override the text prompts as follows:

* `ResourceGroupPrompt`: Give this some custom text to override the default question being asked
* `ResourceGroupLocationPrompt`: Give this some custom text to override the default question being asked

## Output

This blueprint outputs nothing and simply makes the following variables available to the calling blueprint:

* ResourceGroup
* ResourceGroupLocation

