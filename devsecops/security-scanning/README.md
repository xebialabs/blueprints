# Run Your DevSecOps Pipeline

## Introduction

Use this blueprint to configure security scanning tools and an out-of-the-box security dashboard that provides immediate insight into code quality for teams, managers, and auditors.

## Before you get started

If you're new to XebiaLabs blueprints, check out:

* [Get started with DevOps as Code](https://docs.xebialabs.com/xl-platform/concept/get-started-with-devops-as-code.html)
* [Get started with blueprints](https://docs.xebialabs.com/xl-platform/concept/get-started-with-blueprints.html)
* [Get started with XL JetPack](https://docs.xebialabs.com/xl-platform/concept/get-started-with-xl-jetpack.html)

## Usage

To use this blueprint, run `xl blueprint` and select:

    devsecops/security

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

XL Release: Version 8.6.0
XL Deploy: Version 8.6.1
XL CLI: Version 8.6.0

## Prerequisites

To run the YAML that this blueprint generates, you need:

* XebiaLabs Release Orchestration up and running
* Access to one or more security testing tool(s)

## Information required

This blueprint requires:

* Credentials for connecting to your chosen security testing tool(s)

## Output

This blueprint will output:

* Release template
* Security dashboard
* A docker-compose setup for XL Release

## Tips and tricks

* None.

## Labels

* DevSecOps
* Security testing
