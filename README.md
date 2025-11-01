📘 Description

This Bash script monitors the overall health of a Linux system by checking key performance metrics such as:

CPU usage

Memory usage

Disk space

Running processes

If any metric exceeds the predefined threshold, an alert message is logged to a file (system_health.log) and displayed on the console.

🧠 Features

Monitors system performance in real-time

Threshold-based alerting mechanism

Lightweight and easy to customize

Logs alerts for audit or review

⚙️ Usage
# Clone the repository
git clone https://github.com/Jashhh3/system_automation.git
cd system_automation

# Make the script executable
chmod +x system_health.sh

# Run the script
./system_health.sh

🪵 Sample Output
[ALERT] High CPU usage detected: 85%
[ALERT] Memory usage critical: 91%
[INFO] Disk space: 60% used
[INFO] Running processes: 127

