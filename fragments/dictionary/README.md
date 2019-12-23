# Dictionary

## Introduction

This blueprint creates a dictionary for other blueprints to draw secret values from.

## Usage

To use this blueprint, embed a reference to it in your `blueprint.yaml` file:

```yaml
includeAfter:
- blueprint: fragments/dictionary
  parameterOverrides:
  - name: DictionaryDirectoryName
    value: SAME_DIRECTORY_AS_YOUR_BLUEPRINT
```

You probably want to pass the same XL directory from your blueprint to this one.

## Information required

* This blueprint will ask for a comma-separated set of keys (e.g. `key.one,key.two`). The values (usually passwords) will need to be manually captured by the user after the dictionary has been applied to XL Deploy.

## Output

* A YAML environment file for XL Deploy

