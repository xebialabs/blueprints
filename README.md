# XebiaLabs Blueprints

[![Travis Build Status][travis-image]][travis-url-main]

Blueprint definitions for xl-cli. These files will be synced to [https://dist.xebialabs.com/public/blueprints/](https://dist.xebialabs.com/public/blueprints/) and can be used as xl-cli blueprint repository (set by default).

## Adding new blueprint

Simply create a folder and add required files & templates along with the `blueprint.yaml` file. Refer the `CONTRIBUTING.md` file at the root of of this repository for more details.

## Publish

Any changes that are dependent on a new XL CLI version should be done only on the development branch. Master branch should only contain published changes. Development branch needs to be synced to master during every official XL-CLI release

The official blueprints are hosted on our distribution site and are published using the internal [Jenkins Job](https://jenkins-ng.xebialabs.com/jenkinsng/job/XL%20Devops%20As%20Code/job/Blueprints%20Release/) which is triggered manually.

## Generate `index.json` file manually

In the publish step of the release, `index.json` file will be generated automatically based on the directory structure. If needed, `generate_index.py` script can be run manually to generate the `index.json` file on the root of the repository.

## Blueprint Testing

Every blueprint has a subfolder called `__test__` for CI tests. The tests are run in [Travis](https://travis-ci.org/xebialabs/blueprints) for pull requests.

### How to add testing to your blueprint
1. Create a `__test__` directory in your blueprint's directory
2. Create a `.yaml` file that starts with `test` (e.g. `test01.yaml`)
3. Create a `.yaml` answers file containing key/value pairs (For the format of an answers file, see **Blueprint Answers File** in `xl-cli` [blueprints.md](https://github.com/xebialabs/xl-cli/blob/master/docs/blueprints.md))

### Blueprint test file YAML definition file structure

#### Root Fields

| Field Name              | Expected value | Examples         | Required | Explanation                                                                        |
|:-----------------------:|:--------------:|:----------------:|:--------:|:----------------------------------------------------------------------------------:|
| **answers-file**        | —              | `answers01.yaml` | ✔        | The name of the answers file                                                       |
| **expected-files**      | Array          | `dir/file01.txt` | -        | Full path of file produced by blueprint                                            |
| **not-expected-files**  | Array          | `dir/file02.txt` | -        | Full path of file not produced because of `dependsOnTrue` or `dependsOnFalse`      |
| **expected-xl-values**  | Dictionary     | `Varname: val`   | -        | Expected values in `values.xlvals`                                                 |
| **expected-xl-secrets** | Dictionary     | `Varname: val`   | -        | Expected values in `secrets.xlvals`                                                |

Example of a `testxxx.yaml` file:

```yaml
answers-file: answers01.yaml
expected-files:
  - file01.txt
  - dir1/file02.txt
non-expected-files:
  - dir2/needsdependency.txt
expected-xl-values:
  Variable1: value1
  Variable2: value2
expected-xl-secrets:
  Variable3: value3
```

> See the `xl-cli` documentation link above for information on the usage and format of the answers file

Example of a blueprint directory with `__test__` directory:
```
aws/
\-- datalake/
    |-- __test__/
    |   |-- test01.yaml
    |   \-- answers01.yaml
    |-- blueprint.yaml
    \-- xebialabs/
```

When committed, [Travis](https://travis-ci.org/xebialabs/blueprints) will test your blueprint along with all the others.


[travis-image]: https://travis-ci.org/xebialabs/blueprints.svg?branch=development
[travis-url-main]: https://travis-ci.org/xebialabs/blueprints/branches