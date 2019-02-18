# Run Your DevSecOps Pipeline

To use this blueprint, run `xl blueprint` and select:

    devsecops/security

## Labels

* DevSecOps
* Security testing

## Introduction

Use this blueprint to configure security scanning tools and an out-of-the-box security dashboard that provides immediate insight into code quality for teams, managers, and auditors.

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

## Tips and tricks

* None.
