#!/bin/bash

URL="http://your-application-url.com"
STATUS_CODE=$(curl -o /dev/null -s -w "%{http_code}\n" $URL)

if [ $STATUS_CODE -eq 200 ]; then
  echo "Application is up"
else
  echo "Application is down"
fi

