
#!/bin/bash

## Simple script to display system information

 HOST=$( cat /etc/os-release | grep "^NAME" | cut -d '=' -f 2 | tr -d '"')
 ACTIVE_DAYS=$(uptime | grep -oP '\d+(?= day)')

 echo -e  "Displaying system information for host: $HOST" 

 echo -e "System has been up for $ACTIVE_DAYS day(s)"

