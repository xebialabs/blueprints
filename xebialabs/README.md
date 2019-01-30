## Simple security and compliance template and dashboard

The blueprint creates a simple template for security and compliance. It also creates required configuration and dashboard.

### Prerequisites

If you do not have XL Release instances running, you can use this Docker Compose setup to spin them up. The setup also contains a preconfigured Jenkins instance and a dockerproxy container.
Please note that you need to obtain a trial license or bring your own license for XL Release and XL Deploy. Follow the steps below to use the Docker Compose files.

    1. Download the contents of https://github.com/xebialabs/e-commerce-microservice/tree/master/docker-compose/xebialabs into a folder such as `xl-platform`.
    2. Copy the license for XL Release into `xl-platform/xl-release/default-conf/` and the license for XL Deploy into `xl-platform/xl-deploy/default-conf/`.
    3. Run `docker-compose up --build` on the `xl-platform` folder.


To deploy this blueprint with the XebiaLabs DevOps Platform, follow the steps below:

1. Apply the generated YAML configurations using the XL CLI.

    ```
    xl apply -f xebialabs.yaml
    ```

2. Go to XL Release, look for the "fdfd" folder. Create release using template "fdfd security & compliance". Check latest status using "Security and Compliance" dashboard from "fdfd" folder.