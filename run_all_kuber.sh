## declare an array variable
declare -a arr=("https://mil.ru" "http://www.scrf.gov.ru" "https://ach.gov.ru" "https://epp.genproc.gov.ru" "https://www.gosuslugi.ru" "http://kremlin.ru")

## now loop through the above array
for i in "${arr[@]}"
do
   echo "$i"
   # or do whatever with individual element of the array
   export URL=$i
   export NAME=`echo $i| sed 's/\///g'|sed 's/://g'`
   envsubst < "bombardier.yaml" > "bombardier_dst.yaml"
   kubectl apply -f bombardier_dst.yaml

done
