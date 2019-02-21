# Glass Fish

This is an example blueprint with Glass fish.  This *blueprint* leverages xebialabs unsupported docker containers. To run this template you can use the docker-compose file ([doccker-compose.yml](docker-comnpose.yml)).  You will also need access to a JIRA instance.  This template creates an XL Deploy application, a Glass Fish environment and a release template to deploy the application to the sample environment.

## Prerequisites:

1. Download ([doccker-compose.yml](docker-comnpose.yml))
2. Copy the license for XL Release and XL Deploy to `~/xl-licenses/`
3. Run `docker-compose up`

To deploy this blueprint with the XebiaLabs DevOps Platform, follow the steps below:

1. Apply the generated YAML configurations using the XL CLI.
   ```
   xl apply -f xebialabs.yaml
   ```

2. Go to XL Release and look for the data-lake-release-pipeline and start a new release from it.
