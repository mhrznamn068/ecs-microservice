#!/bin/bash

consul agent -bind 0.0.0.0 \
    -join $CONSUL_SERVER \
    -node $NODE \
    -dns-port 53 \
    -data-dir /data \
    -config-dir /etc/consul.d \
    -enable-local-script-checks
