#!/bin/bash

# Variables
SOURCE_DIR="/path/to/source"
BACKUP_DIR="/path/to/backup"

# Create backup
tar -czf $BACKUP_DIR/backup_$(date +%Y%m%d).tar.gz $SOURCE_DIR

# Check if backup was successful
if [ $? -eq 0 ]; then
  echo "Backup successful"
else
  echo "Backup failed"
fi

