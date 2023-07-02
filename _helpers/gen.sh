#!/bin/bash

docker run -v $PWD/../certs:/certs hashicorp/consul:1.14.6 bin/sh -c "cd /certs && consul tls ca create && consul tls cert create -server && consul tls cert create -client && consul tls cert create -cli"

