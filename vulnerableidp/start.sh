#!/bin/bash

# Replace 127.0.0.1:8000 with SP_HOST in source files
if [ -n "$SP_HOST" ]; then
  echo "Replacing 127.0.0.1:8000 with $SP_HOST"
  find /usr/share/simplesamlphp /etc/simplesamlphp/ -type f -exec sed -i "s|127.0.0.1:8000|$SP_HOST|g" {} +
fi

# Replace 127.0.0.1 with IDP_HOST in source files
if [ -n "$IDP_HOST" ]; then
  echo "Replacing 127.0.0.1 with $IDP_HOST"
  find /usr/share/simplesamlphp /etc/simplesamlphp/ -type f -exec sed -i "s|127.0.0.1|$IDP_HOST|g" {} +
fi

if [ -n "$USE_HTTPS" ]; then
  echo "Replacing http://$SP_HOST with https://$SP_HOST"
  find /usr/share/simplesamlphp /etc/simplesamlphp/ -type f -exec sed -i "s|http://$SP_HOST|https://$SP_HOST|g" {} +
  
  echo "Replacing http://$IDP_HOST with https://$IDP_HOST"
  find /usr/share/simplesamlphp /etc/simplesamlphp/ -type f -exec sed -i "s|http://$IDP_HOST|https://$IDP_HOST|g" {} +
fi

a2enconf simplesamlphp
apache2ctl -D FOREGROUND