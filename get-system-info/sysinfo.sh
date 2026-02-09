
#!/bin/bash

## Simple script to display linux system information
# // PLAYING AROUND with grep
 HOST=$( cat /etc/os-release | grep "^NAME" | cut -d '=' -f 2 | tr -d '"')
 ACTIVE_DAYS=$(uptime | grep -oP '\d+(?= day)')
 HOST_VERSION=$( cat /etc/os-release | grep "^VERSION=" | cut -d '=' -f 2 | tr -d '"')

#  // PLAYING AROUND WITH AWK
TOTAL_MEM=$( free -h | awk '/Mem/ {print $2}')

 echo  "Displaying system information for host: $HOST" 

 echo "Version: $HOST_VERSION"

 echo "Total Memory: $TOTAL_MEM"

 echo "System has been up for $ACTIVE_DAYS day(s)"

