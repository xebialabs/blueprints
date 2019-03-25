## Contributing to XebiaLabs blueprints repository

Please refer to the official blueprints [documentation](https://docs.xebialabs.com/xl-platform/concept/getting-started-with-aws-blueprints.html) to learn about Blueprints.

Please refer to this for [blueprints](https://docs.xebialabs.com/xl-platform/concept/blueprint-yaml-format.html) yaml format.

## Creating pull requests

Create a pull request with your proposed changes and request review from a contributor from XebiaLabs organization. Follow the below steps if you are new to the GitHub Git Flow

1. [Fork the repository](https://help.github.com/articles/fork-a-repo/) by clicking on the "fork" button or by visiting [https://github.com/xebialabs/blueprints/fork](https://github.com/xebialabs/blueprints/fork)
2. Create a new branch named appropriately for your changes `git checkout -b my-awesome-branch development`
3. Make your changes, test them and iterate
4. Commit them `git add --all && git commit -m "commit message describing the change"`. Commit often if needed.
4. Once ready, push your changes to your fork `git push origin my-awesome-branch`.
5. You will see a link printed to your terminal to open a PR, click on it and follow through or open a new PR from GitHub https://github.com/xebialabs/blueprints/compare, click on "compare across forks" and choose your fork as the head repository. Select appropriate branch and follow through. Please follow the checklist provided in the pull request template. 

### Unit tests

We use Travis CI to run unit tests against the blueprints. The script in `integration_tests.py` is used for testing and it can also be run locally if you have a Python 3 development environment. Just run `python3 integration_tests.py` on the root of the repository.

Tests are expected in a folder named `__test__` under each blueprint folder. You can have multiple test cases as long as each test case is in a YAML file with a name that starts with `test`. The test file is structured as below:

```
answers-file: answers-01.yaml
expected-files:
  - xebialabs.yaml
  - cloudformation/data-lake-api.yaml
  - xebialabs/USAGE.md
  - xebialabs/xld-environment.yaml
  - xebialabs/xld-infrastructure.yaml
  - xebialabs/xlr-pipeline.yaml
expected-xl-values:
  AWSRegion: us-east-2
expected-xl-secrets:
  AWSAccessKey: ANDGDJDHJHD4235
  AWSAccessSecret: ANDGDJDHJHD4235
```

The `answers-file` needs to be on the same `__test__` folder as well. The `answers-file` holds values for the parameters defined in `blueprint.yaml` file. 
Here is a sample YAML for answers.

```
S3BucketName: my-s3-bucket
AdministratorName: admin
AdministratorEmail: admin@test.com
CognitoDomain: my-domain
UseAWSCredentialsFromSystem: false
AWSAccessKey: ANDGDJDHJHD4235
AWSAccessSecret: ANDGDJDHJHD4235
AWSRegion: us-east-2
```

`expected-xl-values` & `expected-xl-secrets` are optional.

## Creating issues

If you find an issue or have a feature request, please file an issue report by visiting https://github.com/xebialabs/blueprints/issues. Please follow the Bug report or Feature request template provided and fill out all the details.