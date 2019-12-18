# Run Your DevSecOps Pipeline

## Introduction

Use this blueprint to configure security scanning tools and an out-of-the-box security dashboard that provides immediate insight into code quality for teams, managers, and auditors.

## Before you get started

If you're new to XebiaLabs blueprints, check out:

* [Get started with DevOps as Code](https://docs.xebialabs.com/xl-release/concept/get-started-with-devops-as-code.html)
* [Get started with blueprints](https://docs.xebialabs.com/xl-release/concept/get-started-with-blueprints.html)

## Prerequisites

* XebiaLabs Release Orchestration up and running
* Access to one or more security testing tool(s)

## Usage

To use this blueprint, run `xl blueprint` in an empty directory and select:

```plain
devsecops/security
```

## Tools and technologies

This blueprint includes the following tools and technologies:

* Tools:
  * [XebiaLabs Release Orchestration](https://xebialabs.com/products/xl-release/)
  * [Fortify](https://www.microfocus.com/en-us/products/static-code-analysis-sast/overview)
  * [Fortify on Demand](https://www.microfocus.com/en-us/products/application-security-testing/overview)
  * [SonarQube](https://www.sonarqube.org/)
  * [Black Duck](https://www.blackducksoftware.com/black-duck-home)
  * [Checkmarx Static Application Security Testing (SAST)](https://www.checkmarx.com/products/static-application-security-testing/)
  * [Checkmarx Open Source Security Analysis (OSA)](https://www.checkmarx.com/products/open-source-security-analysis/)

## Minimum required versions

This blueprint version requires at least the following versions of the specified tools to work properly:

* XL Release: Version 9.0
* XL CLI: Version 9.0

## Information required

* Credentials for connecting to your chosen security testing tool(s)

## Output

* Release templates
* Security dashboard
* A docker-compose setup for XL Release

## Labels

* DevSecOps
* Security testing

