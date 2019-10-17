# Docker Compose for Hashicorp Vault

## Introduction

This blueprint will create all the files necessary to run an instance of HashiCorp Vault in Docker within the same `xebialabs` Docker network as `xl-devops-platform`.

## Fragment blueprint

This blueprint is a fragment and not meant to run on its own.

## Usage

To use this blueprint, embed a reference to it in your `blueprint.yaml` file:

```yaml
includeAfter:
- blueprint: fragments/docker-compose-hashicorp-vault
```

## Tools and technologies

This blueprint includes the following tools and technologies:

* HashiCorp Vault
* Docker

## Output

This blueprint will output:

* A `docker-compose.yaml` file that will launch the HashiCorp Vault instance

## Labels

* HashiCorp Vault
* Docker
