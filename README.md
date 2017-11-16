# proxylite

### lets create a build config using our lite HA Proxy
oc new-build https://github.com/futureops/proxylite --name proxylite

### lets make a deployment using this new bc/is
oc new-app --image-stream=proxylite -e BACKEND_HOST=infadev -e BACKEND_PORT=7011 --name infadev7011

### our proxy listens on TCP/80 so lets expose our dc on this port
oc expose dc/infadev7011 --port=80

### because we're security concious, we can deploy a path-based route using TLS to expose our proxy service
oc create route edge infadev7011 --service=infadev7011 --path /

### we also may wish to autoscale based on CPU
oc autoscale dc/infadev7011 --min=2 --max=10 --cpu-percent=80

NOTE: autoscaling is dependent on CPU request limits. On DMP you will inherit these from your quota settings, however outside of DMP you will need to manually specify these at point of deployment.
