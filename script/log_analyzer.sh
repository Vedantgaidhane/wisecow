#!/bin/bash

LOG_FILE="/var/log/nginx/access.log"

# Number of 404 errors
error_404=$(grep " 404 " $LOG_FILE | wc -l)
echo "Number of 404 errors: $error_404"

# Most requested pages
echo "Most requested pages:"
awk '{print $7}' $LOG_FILE | sort | uniq -c | sort -nr | head -10

# IP addresses with the most requests
echo "IP addresses with the most requests:"
awk '{print $1}' $LOG_FILE | sort | uniq -c | sort -nr | head -10

