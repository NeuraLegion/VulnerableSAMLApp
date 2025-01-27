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


# # Replace all occurrences of :8000 with an empty string
# echo "Removing all occurrences of :8000"
# find /usr/share/simplesamlphp /etc/simplesamlphp/ -type f -exec sed -i "s|:8000||g" {} +


a2enconf simplesamlphp
apache2ctl -D FOREGROUND