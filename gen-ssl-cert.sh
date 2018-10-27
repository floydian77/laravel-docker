#!/usr/bin/env bash

mkdir -p ssl
openssl req -x509 -nodes -days 365 -newkey rsa:4096 \
    -subj "/C=NL/ST=Gelderland/L=Nijmegen/O=Floydian77 AG/OU=IT/CN=localhost" \
    -keyout ssl/nginx.key \
    -out ssl/nginx.crt
