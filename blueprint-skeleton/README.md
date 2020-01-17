# Blueprint skeleton

This blueprint generates a blueprint skeleton of directories and files in order for you to create your own blueprint.

## Security warning

Be careful when including an secret inputs. These are stored in plain text in a file called `xebialabs/secrets.xlvals`. This is not production-level secure. If you wish to use a more secure method for dealing with secrets and passwords, refer to the `showcases/dictionaries-and-secret-stores` blueprint for a demonstration that uses CyberArk Conjur or HashiCorp Vault to better store and handle secrets.

## Usage

To use this blueprint, run `xl blueprint` in an empty directory and select:

```plain
blueprint-skeleton
```

## Minimum required versions

This blueprint version requires at least the following versions of the specified tools to work properly:

* XL CLI: Version 9.0

## Prerequisites

There are no prerequisites

## Information required

1. The name of the blueprint in _kebabcase_ (lowercase letters, numbers and hyphens)
2. A description of the blueprint
3. Instructions for your users to follow after they have run your blueprint

## Output

* A skeleton blueprint directory and files for you to write your own blueprint
