# Secret Store

## Introduction

This blueprint will create in Docker or connect you to the following already-running 3rd party secret store tools:
* CyberArk Conjur
* HashiCorp Vault


## Fragment blueprint

This blueprint is a fragment and not meant to run on its own.

## Usage

To use this blueprint, embed a reference to it in your `blueprint.yaml` file:

```yaml
includeAfter:
- blueprint: fragments/secret-store
```

You probably want to pass the same XL directory from your blueprint to this one.

## Tools and technologies

This blueprint includes the following tools and technologies:

* CyberArk Conjur
* HashiCorp Vault
* Docker

## Output

This blueprint will output:

* A `docker-compose.yaml` file that will launch the CyberArk Conjur or HashiCorp Vault instance
* A set of instructions for connecting to an existing running instance

## Labels

* CyberArk Conjur
* HashiCorp Vault
* Docker
