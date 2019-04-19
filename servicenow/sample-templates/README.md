# ServiceNow plugin configuration

## Introduction

Use this blueprint to create sample release templates including a configfured connection to ServiceNow. The release templates that the blueprint generates will be samples of what you can do with the ServiceNow plugin.

## Before you get started

If you're new to XebiaLabs blueprints, check out:

* [Get started with DevOps as Code](https://docs.xebialabs.com/xl-platform/concept/get-started-with-devops-as-code.html)
* [Get started with blueprints](https://docs.xebialabs.com/xl-platform/concept/get-started-with-blueprints.html)
* [Get started with XL JetPack](https://docs.xebialabs.com/xl-platform/concept/get-started-with-xl-jetpack.html)

## Usage

To use this blueprint, run `xl blueprint` and select:

    servicenow/sample-templates

## Tools and technologies

This blueprint includes the following tools and technologies:

* Tools:
    * [XebiaLabs Release Orchestration](https://xebialabs.com/products/xl-release/)
    * [ServiceNow](https://docs.servicenow.com/category/madrid)

## Minimum Required versions

This blueprint version requires at least the below versions of the specified tools to work properly.

XL Release: Version 8.6
XL Release ServiceNow plugin: version 8.6
XL CLI: Version 8.6
ServiceNow: Version Kingston and above

## Prerequisites

To run the YAML that this blueprint generates, you need:

* XebiaLabs Release Orchestration with ServiceNow plugin up and running
* ServiceNow instance up and running

## Information required

This blueprint requires:

* The ServiceNow server name
* The ServiceNow url
* The ServiceNow username and password
* The port where the application should be exposed
* If you installed the ServiceNow store app 'XL Release Integration'

## Output

This blueprint will output two YAML files:

* ITSM template
* ITSM & agile template

## Tips and tricks
    
* The YAML templates contain the folder and configuration setup needed in Xl Release.
* The YAML templates contain variables that can be filled from ServiceNow.

## Labels

* ServiceNow
