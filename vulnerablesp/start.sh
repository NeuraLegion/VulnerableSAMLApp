#!/bin/bash


# Replace 127.0.0.1:8000 with SP_HOST in source files
if [ -n "$SP_HOST" ]; then
  find /vulnerableSP -type f -exec sed -i "s/127.0.0.1:8000/$SP_HOST/g" {} +
fi

# Replace 127.0.0.1 with IDP_HOST in source files
if [ -n "$IDP_HOST" ]; then
  find /vulnerableSP -type f -exec sed -i "s/127.0.0.1/$IDP_HOST/g" {} +
fi


# # Replace all occurrences of :8000 with an empty string
# echo "Removing all occurrences of :8000"
# find /vulnerableSP -type f -exec sed -i "s|:8000||g" {} +


cd /vulnerableSP/
python /vulnerableSP/setup.py install
cd /vulnerableSP/yogiSP
uwsgi --ini vulnsp.ini