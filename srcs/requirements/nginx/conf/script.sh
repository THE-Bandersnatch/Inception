#!/bin/sh

openssl genpkey -algorithm RSA -out /etc/ssl/private/private.key


openssl req -x509 -new -key /etc/ssl/private/private.key -out /etc/ssl/certs/certificate.crt -days 365 -subj "/C=MO/L=BN/O=1337/OU=student/CN=mochaoui.42.ma"

exec "$@"