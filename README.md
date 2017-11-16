# proxylite

### lets create a build config using our lite HA Proxy
oc new-build https://github.com/futureops/docker-proxy --name proxylite

### lets make a deployment using this new bc/is
oc new-app --image-stream=proxylite -e BACKEND_HOST=infadev -e BACKEND_PORT=7011 --name infadev7011

### our proxy listens on TCP/80 so lets expose our dc on this port
oc expose dc/infadev7011 --port=80

### because we're security concious, we can deploy a path-based route using TLS to expose our proxy service
oc create route edge infadev7011 --service=infadev7011 --path /
