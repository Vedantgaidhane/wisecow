#!/bin/bash

# Define thresholds
CPU_THRESHOLD=80
MEMORY_THRESHOLD=80
DISK_THRESHOLD=80

# Check CPU usage
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
cpu_usage=${cpu_usage%.*}
if [ $cpu_usage -gt $CPU_THRESHOLD ]; then
  echo "CPU usage is above threshold: $cpu_usage%"
fi

# Check memory usage
memory_usage=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
memory_usage=${memory_usage%.*}
if [ $memory_usage -gt $MEMORY_THRESHOLD ]; then
  echo "Memory usage is above threshold: $memory_usage%"
fi

# Check disk usage
disk_usage=$(df / | grep / | awk '{print $5}' | sed 's/%//g')
if [ $disk_usage -gt $DISK_THRESHOLD ]; then
  echo "Disk usage is above threshold: $disk_usage%"
fi

# Check running processes
process_count=$(ps aux | wc -l)
echo "Number of running processes: $process_count"

