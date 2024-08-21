#!/bin/sh

# Generate a private key
openssl genpkey -algorithm RSA -out /etc/ssl/private/private.key



# Generate a self-signed certificate
openssl req -x509 -new -key /etc/ssl/private/private.key -out /etc/ssl/certs/certificate.crt -days 365 -subj "/C=MO/L=BN/O=1337/OU=student/CN=mochaoui.42.ma"

# mkdir -p /etc/nginx/c

# Append the configuration to Nginx
# echo "
# " > /etc/nginx/conf.d/nginx.conf

# Start Nginx
exec "$@"