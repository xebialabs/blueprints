## Definition of Done

This is the definition of done for (new and modified) blueprints to be accepted into the [central XebiaLabs blueprints repository](https://github.com/xebialabs/blueprints).

**Value**

This section describes how to determine whether a blueprint has enough value to be included in the central XebiaLabs blueprints repository.

- [ ] The blueprint applies to a focused use case.
- [ ] The blueprint uses at least one XebiaLabs product.
- [ ] The blueprint depends on as few other products as possible. **N.B.:** This is part of the definition of done to keep the blueprint focused and applicable to as many users as possible. A blueprint that depends on one spefic CI tool, one specific Java EE application server and one specific ticketing system can only be used by users that have all three products.
- [ ] The blueprint can be used with content supplied by the user but also includes demo content. A blueprint that does not work with content supplied by the user is a demo or a showcase and does not help the user with their own work.

**Technical**

This section describes how to determine whether the blueprint has the right technical quality to be included in the central XebiaLabs blueprints repository.

- [ ] The branch from which the PR is created is up-to-date with the `development` branch.
- [ ] The blueprint generates a `xebialabas/README.md` file which, at the minimum, explains how to use the blueprint after it is generated (like adding any missing steps, creating accounts, setting up docker containers, applying the YAML using `xl` CLI, running release etc). **N.B.:** Do not use this document to document how to instantiate the blueprint because it will only be avialable to the user after the blueprint has been instantiated
- [ ] The blueprint generates a `docker/docker-compose.yml` file which can be used to 
 add the blueprint generation steps here as it wont be useful since the file is ceated only after the blueprint generation.
- [ ] The blueprint does not contain sensitive information such passwords, tokens, credentials or licences. 
- [ ] The blueprint uses `secret: true` in the `blueprint.yaml` parameter definition for question that ask for sensitive information.
- [ ] The blueprint does not contain the files `xebialabs/.gitignore`, `xebialabs/values.xlvals` and `xebialabs/secrets.xlvals` and does not refer to them from the files section of the `blueprint.yaml` file. These files will be generted when the blueprint is instantiated. To generate the `xebialabs/values.xlvals` file, use the `saveInXlVals: true` directive in the parameters section of the blueprint. To generate the `xebialabs/secrets.xlvals` file, use the `secret: true` directive .
- [ ] The blueprint does not define parameters for trivial things like phase names, task names, folder names etc. Ask questions that add value and be opinionated where possible. For example, ask for a project name and derive folder names, task names etc from that.
- [ ] Folder and file names must use [kebab-case](http://wiki.c2.com/?KebabCase), for example: `aws/sample-app-demo`, `xld-environment.yaml`
 
 
**Review and testing**

This section describes how to determine whether the blueprint has been reviewed and tested well enough to be included in the central XebiaLabs blueprints repository.

- [ ] The CI for the PR is green
- [ ] The blueprint has been reviewed by someone else in the team.
- [ ] The blueprint has been manually tested with the `docker/docker-compose.yml` that is generated as part of it.
- [ ] The blueprint works on Linux, Mac and Windows.
