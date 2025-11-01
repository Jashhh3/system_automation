#!/bin/bash

# Log file location
LOG_FILE="/var/log/system_health.log"

# Thresholds
CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=80

# Get current usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
MEM_USAGE=$(free | awk '/Mem/{printf("%.2f"), $3/$2 * 100.0}')
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

# Current timestamp
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

# Function to log alerts
log_alert() {
  echo "[$TIMESTAMP] ALERT: $1" | tee -a "$LOG_FILE"
}

# Check CPU usage
if (( ${CPU_USAGE%.*} > CPU_THRESHOLD )); then
  log_alert "High CPU usage: ${CPU_USAGE}%"
fi

# Check Memory usage
if (( ${MEM_USAGE%.*} > MEM_THRESHOLD )); then
  log_alert "High Memory usage: ${MEM_USAGE}%"
fi

# Check Disk usage
if (( DISK_USAGE > DISK_THRESHOLD )); then
  log_alert "Low Disk Space: ${DISK_USAGE}% used"
fi

# Log top 5 processes
echo "[$TIMESTAMP] Top 5 memory-consuming processes:" >> "$LOG_FILE"
ps -eo pid,comm,%mem,%cpu --sort=-%mem | head -n 6 >> "$LOG_FILE"
echo "----------------------------------------" >> "$LOG_FILE"
