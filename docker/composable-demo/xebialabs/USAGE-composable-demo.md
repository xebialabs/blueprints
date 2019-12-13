# Composed Docker Deployment Usage

## Notes

This blueprint comprises 3 other blueprints:

1. Docker compose file to run XL Deploy
2. Local Docker environment
3. Application to run on the environment

## Deploy the blueprint to the XL Platform

To deploy this blueprint to the XebiaLabs DevOps Platform, open up a terminal in the folder where you generated the configuration. Then run:

    ```plain
    xl apply -f xebialabs.yaml
    ```

## Deploy to Docker

Follow the instructions in the following `USAGE` files under the `xebialabs` directory in order:

1. `USAGE-docker-compose.md`
This tells you about running Docker containers for XL Deploy, Xl Release and the Docker proxy.

2. `USAGE-environment.md`
This tells you about the basic Environment in XL Deploy where the Docker application will be deployed.

3. `USAGE-application.md`
This tells you how to deploy and test the application in XL Deploy.

