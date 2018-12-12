#!/bin/sh                                                                                                                                                   
set -ue

# The number of unrestricted memory. 
unlimitMemoryBytes=9223372036854771712 

# Convert bytes to megabytes                                                                                                                                
byteToMega=1048576                                                                                                                                          

# The upper limit of available memory space for the current container.                                                                                      
limitMemoryBytes=$(cat /sys/fs/cgroup/memory/memory.limit_in_bytes)
if [ $limitMemoryBytes -eq $unlimitMemoryBytes ]
then
  echo "No container cap is set and the default value is 512m."
  limitMemoryBytes=536870912
fi

# The JVM has available heap space as a percentage of total memory space.                                                                                   
percentage=80

limitMemoryMega=$(expr $limitMemoryBytes / $byteToMega)                                                                                                   
limitUserMemoryMega=$(( limitMemoryMega * percentage ))                                                                                                   
limitUserMemoryMega=$(( limitUserMemoryMega / 100 ))                                                                                                      
command="xjava -Xms${limitUserMemoryMega}m -Xmx${limitUserMemoryMega}m"                                                                                   
for var in $@                                                                                                                                             
do
  # if the parameter length is greater than 4, you need to check for -xmx and -xms, which will be ruled out because it will be set automatically.
  if [ ${#var} -ge 4 ]
  then
    if [ "${var:0:4}" == "-Xmx" -o "${var:0:4}" == "-Xms" ]
    then
      continue
    else
      command="$command $var"
    fi
  else                                                                                                                                                    
      command="$command $var"
  fi
done
exec $command
