# Kubernetes Environment Blueprint Usage

## Notes

* Instantiate and apply the companion `kubernetes/application` blueprint to create an application that can be deployed to this environment.

## Deploy the blueprint to the XL Platform

To deploy this blueprint to the XebiaLabs DevOps Platform, open up a terminal in the folder where you generated the configuration. Then run:

```plain
xl apply -f xebialabs.yaml
```

Applying this XL YAML file will create:

* A `k8s.Master` infrastructure CI for your Kubernetes cluster
* A `k8s.Namespace` for the namespace you specified
* A `udm.Environment` that refers to that `k8s.Namespace`

