
#!/bin/bash

## Simple script to display linux system information
# // PLAYING AROUND with grep and awk
 HOST=$(cat /proc/version | awk ' { print $1 }')
 HOST_VERSION=$(cat /proc/version | awk ' { print $3 }')
 DISTRO=$( cat /etc/os-release | grep "^NAME" | cut -d '=' -f 2 | tr -d '"')
 ACTIVE_DAYS=$(uptime | grep -oP '\d+(?= day)')
 DISTRO_VERSION=$( cat /etc/os-release | grep "^VERSION=" | cut -d '=' -f 2 | tr -d '"')

#  // PLAYING AROUND WITH AWK
MEMORY=$( free -h )
# This part was a bit tricky, using `echo` command on the variable $MEMORY (as such echo $MEMORY) returned output flattend to one line,
# So using awk to print out the 2nd parameter for Total/Avail memory was returning headers instead of Figures.
# Solution was to use wrap the variable `$MEMORY` in quotes "", that way the output was not flattend
TOTAL_MEM=$( echo "$MEMORY" | awk '/Mem/ { print $2 }')
AVAIL_MEM=$( echo "$MEMORY" | awk '/Mem/ { print $7 }')

STORAGE=$(df --total -h)
TOTAL_STORAGE=$( echo "$STORAGE" | awk '/total/ { print $2 } ')
USED_STORAGE=$( echo "$STORAGE" | awk '/total/ { print $3 } ')
AVAIL_STORAGE=$( echo "$STORAGE" | awk '/total/ { print $4 } ')

 echo  "Displaying system information for host: $HOST" 

 echo "Host Version: $HOST_VERSION"

 echo "Distribution: $DISTRO"

 echo "Distribution Version: $DISTRO_VERSION"

 echo "Total Memory: $TOTAL_MEM"

 echo "Available Memory: $AVAIL_MEM"

 echo "Total Storage Space: $TOTAL_STORAGE"

 echo "Used Storage Space: $USED_STORAGE"

 echo "Available Storage Space: $AVAIL_STORAGE"

 echo "System has been up for $ACTIVE_DAYS day(s)"

