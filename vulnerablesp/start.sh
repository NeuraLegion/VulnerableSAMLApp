#!/bin/bash

# Replace 127.0.0.1:8000 with SP_HOST in source files
if [ -z "$SP_HOST" ]; then
  echo "SP_HOST is not set. Exiting."
  exit 1
fi

find /vulnerableSP -type f -exec sed -i "s/127.0.0.1:8000/$SP_HOST/g" {} +

# Start the application
exec "$@"
