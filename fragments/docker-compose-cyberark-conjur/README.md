# Docker Compose for CyberArk Conjur

## Introduction

This blueprint will create all the files necessary to run an instance of CyberArk Conjur in Docker within the same `xebialabs` Docker network as `xl-devops-platform`.

## Fragment blueprint

This blueprint is a fragment and not meant to run on its own.

## Usage

To use this blueprint, embed a reference to it in your `blueprint.yaml` file:

```yaml
includeAfter:
- blueprint: fragments/docker-compose-cyberark-conjur
```

## Tools and technologies

This blueprint includes the following tools and technologies:

* CyberArk Conjur
* Docker

## Output

This blueprint will output:

* A `docker-compose.yaml` file that will launch the CyberArk Conjur instance

## Labels

* CyberArk Conjur
* Docker
