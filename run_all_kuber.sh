
declare -a arr=("https://mil.ru" "http://www.scrf.gov.ru" "https://ach.gov.ru" "https://epp.genproc.gov.ru" "https://www.gosuslugi.ru" "http://kremlin.ru")


for i in "${arr[@]}"
do
   echo "$i"
   export URL=$i
   export NAME=`echo $i| sed 's/\///g'|sed 's/://g'`
   envsubst < "bombardier.yaml" > "bombardier_dst.yaml"
   kubectl apply -f bombardier_dst.yaml
done
