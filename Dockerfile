FROM haproxy:1.6-alpine
MAINTAINER Glen Messenger <glen.messenger@transport.nsw.gov.au>

# Copy HAproxy configuration
COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg

#Declare Environment Variables
ENV BACKEND_HOST \
    BACKEND_PORT
