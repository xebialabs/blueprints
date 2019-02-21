# ServiceNow Pet Portal Demo

This is my Pet Portal includes extra governance in Service Now.  This blueprint also leverages the xlr-xlrelease-plugin to dynamically tag the releases with the Service Now tickets.  To setup this showcase you should use the included [docker-compose.yml](docker-compose.yml) file.  The *xld-xlrelease-plugin* will need to be stored relative to the *docker-compose.yml* at *xlr/plugins/xlr-xlrelease-plugin-2.3.4.jar*.

## Additional Requirements:
  * [xlr-xlrelease-plugin](https://github.com/xebialabs-community/xlr-xlrelease-plugin)
