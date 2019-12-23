# GCP Region

## Introduction

This blueprint can be used by other GCP-based blueprints to collect the name of the region.

## Fragment blueprint

This blueprint is a fragment and not meant to run on its own.

## Usage

To use this blueprint, embed a reference to it in your `blueprint.yaml` file:

```yaml
includeAfter:
- blueprint: fragments/gcp-region
```

### Prompts

You can override the text prompts as follows:

* `GCPRegionPrompt`: Give this some custom text to override the default question being asked

## Output

This blueprint outputs nothing and simply makes the following variables available to the calling blueprint:

* GCPRegion

