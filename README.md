# XebiaLabs Blueprints

Blueprint definitions for xl-cli. These files will be synced to [https://dist.xebialabs.com/public/blueprints/](https://dist.xebialabs.com/public/blueprints/) and can be used as xl-cli blueprint repository (set by default).

## Adding new blueprint

Simply create a folder and add required files & templates along with the `blueprint.yaml` file.

## Publish

Any changes that are dependent on a new XL CLI version should be done only on the development branch. Master branch should only contain published changes. Development branch needs to be synced to master during every official XL-CLI release

The official blueprints are hosted on our distribution site and are published using the internal [Jenkins Job](https://jenkins-ng.xebialabs.com/jenkinsng/job/XL%20Devops%20As%20Code/job/Blueprints%20Release/) which is triggered manually.

## Generate `index.json` file manually

In the publish step of the release, `index.json` file will be generated automatically based on the directory structure. If needed, `generate_index.py` script can be run manually to generate the `index.json` file on the root of the repository.
