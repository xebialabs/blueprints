## Hello World example on XL Deploy + Release
The blueprint creates XL Deploy + Release objects to demonstrate how a simple application can be managed with a Release Template.
XL Deploy does the provisioning and deployment, while XL Release orchestrates everything.

### Prerequisites
1. XL Deploy 8.5 or higher
2. XL Release 8.5 or higher
3. XL CLI 8.5 or higher
3. Access to a Linux-based host

## Overview
This blueprint is designed to help new users see how to create a blueprint from a small XLD and XLR definitions.  

## Outline of our Steps
We're going to follow some steps so we can build a sample blueprint. These steps below should take between 30-60 minutes.

1. We’ll start by creating an environment with an application in XLD.
    a. Add a SSHD container to XLD as infrastructure.
    b. Create a Dev environment using this infrastructure.
    c. Create a sample "Hello World" application.
    d. Deploy this application to verify it works.
    e. Create a second Environment named Test.
2. Next, setup XLR to use what we built in XLD.
    a. Create an XLR Release Template with two phases.
    b. Add deployments to DEV and TEST.
3. Create the blueprints from XLD and XLR.
4. Modify these blueprints.
5. Run these blueprints.

I used Docker containers during my development, and that is why the name “Docker” appears in these examples.

## Creating a working XLD environment
### Configure Infrastructure
We’re going to build XLD objects in the order of Infrastructure, Environments, and Application.

In XL Deploy, Let’s create a new directory with _Infrastructure->New->Directory._ Name this directory as *HelloWorldInfrastructure.* Putting infrastructure in a directory makes it easier to generate the blueprint YAML files because we’ll have two objects to export.

Next, let’s add two endpoints where we can run echo commands to the CLI. In this exercise, we’re using a Linux host running SSHD.

Create your first Infrastructure object with _Infrastructure->HelloWorldInfrastructure->New->overthere.SshHost._ These are the details you should use.

***
-  ID: ```MyLocalHost-DEV```
-  Infrastructure -> ```overthere.SshHost```
-  Temporary Directory Path: ```/tmp```
-  Operating System: ```UNIX```
-  Connection Type: ```SCP```
-  Address: ```172.21.215.81``` (Your value will be different)
-  Port: ```32769``` (normally this is “22” but in my example I’m running a SSHD server locally on a different port)
-  Username: ```root```
-  Password: ```<your password>```
***

Save and then Test the connection to verify connectivity. Duplicate this Infrastructure and name it "MyLocalHost-TEST."

Congratulations! You have working infrastructure that can run a shell command to print “Hello World” to the CLI.

### Configure an Environment
 

In XLD, create an Environment directory with _Environments->New->Directory._

Name this new Directory as *HelloWorldEnvironments.*

Next, create a new environment with _Environments->HelloWorldEnvironments->New Environment_, and supply this information:

***
- Name: ```MyDockerDev```
- Containers: ```Infrastructure/HelloWorldInfrastructure/MyLocalHost-DEV```
***

Similarly, create a second TEST environment with _Environments->HelloWorldEnvironments->New Environment_ and use this information:

***
- Name: ```MyDockerTest```
- Containers: ```Infrastructure/HelloWorldInfrastructure/MyLocalHost-TEST```
***

We now have Environments.

### Configure an Application
In XLD, create a new Application with _Applications->New Application,_ and supply this information:

***
- Name: ```MyTestApplication```
***

Create a Deployment Package with _Applications/MyTestApplication->New->Deployment Package,_ and name it “1.0”

***
- Name: ```1.0```
***

Finish the Application definition with _Applications/MyTestApplication->1.0->New->cmd->Command_ to specify a command-line execution of “Hello World.”

***
- Name: ```Say Hello World```
- Command Line: ```echo "Hello World"```
***

Please note when we created the Environment and Application, we created Folders and then children of these folders of different object types. We will need to adjust our files later to ensure we’re replicating the same hierarchy.

### Deploy the Application
Test your application by deploying the 1.0 version of MyTestApplication to the MyDockerDev environment, and observe how the output of the "Execute Say Hello World" command is "Hello World" in the Deployment steps.

Undeploy the application to clear out your environment inventory.

We now have a working XLD setup and we can move onto XLR.

## Setting up XLR
We’ll build a XLR template to use the pieces we built in XLD. We will also run this template to verify it does what we expect. These are the same steps your team may perform when initially developing their deployment and release, and before converting your work to a blueprint.

### Create an XLR Release Template with two phases
In the XLR Design Tab, Add a Folder and name it “Hello World.” This is where we’ll store our template.

Click on “Hello World” folder and “Add Template” to create a new Template. Supply the following details:

***
- Template name: Hello World XLR Template
Select an due date a few weeks into the future
***

Create the template to finish your operation. Next, we’ll fill in the Template with details.

### Add deployments to DEV and TEST
We will be adding phases to the release template, and tasks to perform deployments and manual steps. The steps here are prescriptive:

1. Name the first Phase, ```DEV```
2. Create a second Phase with the name, ```TEST```
3. Add a task to the DEV named ```Manual Start Task``` of type Manual
    a. Assign it to yourself.
4. Add task to the DEV named ```Deploy to Dev``` of type XL Deploy->Deploy
    a. Edit the Deploy task and specify the Application "Applications/MyTestApplication"
    b. Version: ```1.0```
    c. Environment: ```Environments/HelloWorldEnvironments/myDockerDev```
5. Add task to the TEST phase named ```Deploy to Test``` of type XL Deploy->Deploy
    a. Edit the Deploy task and specify the Application "Applications/MyTestApplication"
    b. Version: ```1.0```
    c. Environment: ```Environments/HelloWorldEnvironments/myDockerTest```
6. Add a task to the TEST phase named ```Manual End Task``` of type Manual

### Run the release

1. Click on the "New Release" button to start a new release from this template
    a. Name it ```Hello World 1.0```
2. Start the release by clicking on the "Start Release" button

Click into the manual tasks, assign the tasks yourself and approve them. When you verify the release succeeds, you are ready to create blueprints.

## Create Blueprints
We're going to [follow the instructions]( https://docs.xebialabs.com/xl-platform/concept/getting-started-with-devops-as-code.html) to generate the essential YAML files for our Application, Environment, Infrastructure, and Release. Note how we specify ```xl-deploy``` and ```xl-release``` for the server, and how we utilize Directories and Folders to make it easier to export our files.

At your Linux command prompt, create working folders and run the generate command for your applications, environments, infrastructure, and release template:

```
$ mkdir -p tutorials/helloworld/xebialabs
$ cd tutorials/helloworld/xebialabs
$ xl generate -s xl-deploy -p Applications/MyTestApplication -f myapplication.yaml.tmpl
$ xl generate -s xl-deploy -p Environments/HelloWorldEnvironments -f myenvironments.yaml.tmpl
$ xl generate -s xl-deploy -p Infrastructure/HelloWorldInfrastructure -f myinfrastructure.yaml.tmpl
$ xl generate -s xl-release -p "Hello World/Hello World XLR Template" -f myrelease.yaml.tmpl
```

Next, create a top-level ```tutorials/index.json``` file of this format:

```
[
  "helloworld"
]
```
Please NOTE: This repository already contains the reference to the HelloWorld blueprint along with several others.  You only need to create ```index.json``` if you are doing this on your own isolated directory.

We are going to add variables to these files and make them templates. This is why we’re starting by the extension ```.yaml.tmpl.``` If we did not plan to use any variables, we could have just used the ```.yaml``` extension.

If we follow the [DevOps-As-Code guidance](https://docs.xebialabs.com/xl-platform/concept/blueprint_repository.html), we will finish with this directory structure:

```
├── index.json (required)
    └── <your blueprint name, in this case "helloworld">/
        ├── blueprint.yaml (required - the specification of your inputs)
        ├── xebialabs.yaml (specifies files to import)
        └── xebialabs/ (output directory)
            ├── myinfrastructure.yaml.tmpl
            ├── myenviornments.yaml.tmpl
            ├── myapplications.yaml.tmpl
            ├── myrelease.yaml.tmpl
            ├── README.md.tmpl (documentation file)
```

## Now what?
Given some YAML template files, let's use these files to generate a more proper blueprint, where we will be able to prompt a user for details to render appropriate outputs. The goal here is to parameterize the application, environment, and infrastructure names so we can call the blueprint more than once and see the outcomes in XLD. Similarly, we want to see some outcomes in XLR.

If we wish to parameterize the names of these objects, we can follow the  [blueprint instructions on values ](https://docs.xebialabs.com/xl-platform/concept/manage-values-devops-as-code.html) to let us do this via a text file in the existing folder, environment variables, or via command-line. We're going to utilize a fourth option - prompting the user for the values.

### Ask the questions in blueprint.yaml
We’re going to add variables so users can supply essential details. These questions are governed by a root-level file ```blueprint.yaml```. It is easier easiest to start with the ```blueprint.yaml``` file and fill out the YAML to specify the questions and variables we want to use. Once we do the top-level ```blueprint.yaml``` file, we can modify our template files. Here is an example of this ```blueprint.yaml``` file. We added comments to help document the logic and purpose a little better.

``` 
# The information below is boilerplate for the blueprint.
apiVersion: xl/v1
kind: Blueprint

# This metadata helps the next user better understand what the blueprint is about.

metadata:
  projectName: HelloWorld
  description: |
    The blueprint creates a Hello World application, environment, and infrastructure for the purpose of illustrating how a 
    blueprint works.  We also use XL Release to orchestrate the distribution of this software to environments, so you can 
    also see how to plumb-in XLR into a blueprint.
  author: XebiaLabs
  version: 1.0
  
parameters:
# The blueprint mechanism will prompt the user for these values.  The specification for these parameters start at the following location:
# https://docs.xebialabs.com/xl-platform/concept/blueprint-yaml-format.html
# See also the real-world example of how some of these are organized at:
# https://github.com/xebialabs/blueprints/blob/master/aws/microservice-ecommerce/blueprint.yaml
# The values below are going to substituted into different XLD and XLR places.  The questions are meant to help explain how the value will be used?
# XLD substitutions

- name: AppName
  description: What is the name of the application?
  type: Input
  default: HelloWorldApp
- name: envName
  description: What is the name of your Environment?
  type: Input
  default: HelloWorldEnv
- name: infraName
  description: What is the name of your infrastructure?
  type: Input
  default: HelloWorldInf
- name: linuxNetworkAddress
  description: What is the network address of your Linux instance?
  type: Input
  default: localhost
- name: linuxPort
  description: What is the SSH port to your Linux instance?
  type: Input
  default: 22
- name: linuxUsername
  description: What is the username of your Linux SSH user?
  type: Input
  default: root
- name: linuxPassword
  description: What is the password for the Linus SSH user?
  type: Input
  secret: true
  default: screencast

# XLR specific variables
- name: relTemplateName
  description: What is the name of your Release Template?
  type: Input
  default: HelloWorldTemplate
- name: phase1Name
  description: What is the name of your first phase?
  type: Input
  default: DEV
- name: phase2Name
  description: What is the name of your second phase?
  type: Input
  default: TEST

files:
- path: xebialabs/myapplication.yaml.tmpl
- path: xebialabs/myenvironments.yaml.tmpl
- path: xebialabs/myinfrastructure.yaml.tmpl
- path: xebialabs/myrelease.yaml.tmpl
- path: xebialabs/README.md.tmpl
```

A few things to note:

1. See the [blueprint field reference](https://docs.xebialabs.com/xl-platform/concept/blueprint-yaml-format.html) for explanations about the different field types.
2. The files: section contains references to our four YAML templates, plus a README.md.tmpl which will contain our blueprint description.
3. We use the secret:true declaration for the SSH password above. This is one of several options you can utilize to improve your blueprint.
4. We are using defaults above to guide the user toward a potential solution. Defaults make more sense for some values we know tend to have constant values, such as the address of a fixed web service. Defaults make less sense for those values that always change, such as an ephemeral port.

### Next, replace hard-coded values with variables
At this point, you are almost ready to run a blueprint to create a new Release Template. However, we have to do two more steps. The first is to add variables to our templates that match our questions. The second is to enhance our YAML to explicitly declare some structures that are missing but necessary for brand-new instantiations.

The Application template file is presented below with variable substitutions in place:

```
apiVersion: xl-deploy/v1
kind: Applications
spec:
# The folder structure needs to be defined explicitly because we can have different types at each level.
- name: Applications/{{.AppName}}
  type: udm.Application
- name: Applications/{{.AppName}}/1.0
  type: udm.DeploymentPackage
  deployables:
  - name: Say Hello World
    type: cmd.Command
    commandLine: echo "hello World"
```
Note a few things.

1. The variable de-referencing is with {{.variable}} notation.
2. When we use nested folders and structures, we need to add those items into the YAML. In the application file above, this means the following lines were added:
***
- name: Applications/{{.AppName}}
- type: udm.Application
***

The Environment YAML template has a similar requirement to add the directory declaration in this snippet:

```
spec:
- directory: Environments/{{.envName}}
- name: Environments/{{.envName}}/myDockerDEV
``` 

And the Infrastructure YAML template has another for it’s directory declaration in this snippet:

```
spec:
- directory: Infrastructure/{{.infraName}}
- name: Infrastructure/{{.infraName}}/MyLocalHost-DEV
```

### Run a local web server
When you are actively developing a blueprint, it is best to run a local web server to provide the files. This is because our blueprint engine needs to be able to browse-to-a-server. One efficient way of doing this is to run a local Python web server with a command like this from the directory that contains your ```index.json``` file:

```
python -m SimpleHTTPServer
``` 

This has the effect of setting the current directory as the base for a default http://localhost:8000 webpage.

### Run the apply command
We’re ready!

All of this work pays off for a few reasons. First, we are ready to run a blueprint. Second, you can expect to run through a similar sequence for when you want to create blueprints in your environment. Where this may make sense is when you want to create a base definition of a set of items, including a Release Template, but need to make some things specific for a team or use case that you are not going to make run-time parameters.

Generating the files specific to your instance from a blueprint is easy enough with the ```xl blueprint``` command:

```
C:\Users\Marco\code\blueprints\tutorials\helloworld>xl blueprint --blueprint-repository-url http://localhost:8000
? Choose a blueprint: helloworld
? What is the name of the application? HelloWorldApp
? What is the name of your Environment? HelloWorldEnv
? What is the name of your infrastructure? HelloWorldInf
? What is the network address of your Linux instance? 172.21.215.81
? What is the SSH port to your Linux instance? 32769
? What is the username of your Linux SSH user? root
? What is the password for the Linus SSH user? **********
? What is the name of your Release Template? HelloWorldTemplate
? What is the name of your first phase? DEV
? What is the name of your second phase? TEST
? Confirm to generate blueprint files? Yes
[file] Blueprint output file 'xebialabs/values.xlvals' generated successfully
[file] Blueprint output file 'xebialabs/secrets.xlvals' generated successfully
[file] Blueprint output file 'xebialabs/.gitignore' generated successfully
[file] Blueprint output file 'xebialabs/myapplication.yaml' generated successfully
[file] Blueprint output file 'xebialabs/myenvironments.yaml' generated successfully
[file] Blueprint output file 'xebialabs/myinfrastructure.yaml' generated successfully
[file] Blueprint output file 'xebialabs/myrelease.yaml' generated successfully
[file] Blueprint output file 'xebialabs/README.md' generated successfully
```

The ```xl blueprint``` command renders files with the details you entered. This operation does not yet create objects in your system. In order to create objects, you need to run ```xl apply``` with these files.

This is a good time to inspect your output files noted above to see how the variable substitutions succeeded, including the ```secrets.xlvals```. I’ve used editors, and I’ve also used code diffs to see the side-by-side differences.

Next, let’s apply the changes:

```
C:\Users\Marco\code\blueprints\tutorials\helloworld>xl apply -f xebialabs.yaml
Applying myinfrastructure.yaml (imported by xebialabs.yaml)
Created Infrastructure/HelloWorldInf
Created Infrastructure/HelloWorldInf/MyLocalHost-DEV
Created Infrastructure/HelloWorldInf/MyLocalHost-TEST
Applying myenvironments.yaml (imported by xebialabs.yaml)
Created Environments/HelloWorldEnv
Created Environments/HelloWorldEnv/myDockerDEV
Created Environments/HelloWorldEnv/myDockerTEST
Applying myapplication.yaml (imported by xebialabs.yaml)
Created Applications/HelloWorldApp
Created Applications/HelloWorldApp/1.0/Say Hello World
Created Applications/HelloWorldApp/1.0
Applying myrelease.yaml (imported by xebialabs.yaml)
Updated Applications/Release02ce93c4d1744a5a90cb8a4dac7fde0d
Updated Applications/Release02ce93c4d1744a5a90cb8a4dac7fde0d/summary
Applying xebialabs.yaml
Done
``` 

At this time, you can navigate to XLR to create and run the new release. It should “just work.”

## In summary
The example here takes us through the entire lifecycle of generating a brand-new deployment and release, and then converting that asset into a blueprint for re-use. Where you can use this DevOps-as-Code technique is to store your definitions into source control for reuse within your teams. Your examples will be more complex, and the value of being able to onboard any combination of applications, environments, and infrastructure gives you a strong capability of taking out unintended variations of human data entry. When you add the ability to orchestrate your activities around a release, you gain much higher confidence your release is deterministic and repeatable.

## Reference materials
- Internal Blueprints registry and description: https://xebialabs.atlassian.net/wiki/spaces/XLDEP/pages/695336964/XebiaLabs+Blueprints

- DevOps as Code overview:
https://docs.xebialabs.com/xl-platform/concept/devops-as-code-overview.html

- Blog posting about Blueprints, introducing the topic:
https://blog.xebialabs.com/2019/01/08/all-aboard-get-everyone-on-the-devops-train-with-xebialabs-blueprints/