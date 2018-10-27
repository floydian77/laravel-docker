#!/usr/bin/env bash

openssl genrsa -out server.key 3072 -nodes
openssl req -new -x509 -key server.key -sha256 -config openssl.cnf -out server.crt -days 730
