# Docker

These are notes common to all Docker blueprints.

## Docker proxy

If you are using a platform other than Linux, you'll need to deploy a Docker proxy (on port 2375) so that XL Deploy will be able to deploy Docker images.

You can deploy the proxy by:

1. Running the `xl-devops-platform` blueprint separately
2. Running the `xl-devops-platform` blueprint as part of one of the Docker blueprints

### Linux

Under Linux, follow [these instructions](https://docs.docker.com/engine/reference/commandline/dockerd/) for setting up TCP access to port 2375.
