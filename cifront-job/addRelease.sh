#!/bin/bash
IFS='
'

types=${RELEASE_TYPES:-".*\.js$|.*\.css$"}

echo ${types}

echo "Searching under ${RELEASE_DIR_ROOT}"

fileList=(`find ${RELEASE_DIR_ROOT} -name "*"| egrep -i "$types" | sort`)

fileListLen=${#fileList[@]}

echo "filelist size is ${fileListLen}"

prefixSize=$((${#RELEASE_DIR_ROOT}+2))

assets="["
for index in ${!fileList[@]}
do
  str=${fileList[$index]}
  assets+="\""`echo "$str"|cut -c$prefixSize-${#str}`"\""
  fileListLenS=$((fileListLen-1))
  if [ $index -ne $fileListLenS ];then
    assets+=","
  fi
done
assets+="]"

echo "START WRITE BACK"
echo "RELEASE NAME:${RELEASE_NAME}"
echo 'PAYLOAD:{"fields":{"projectName":"'${RELEASE_NAME}'","assetsName":'${assets}'}}'

val_WORKER_PLATFORM_URL=`eval echo '$'WORKER_PLATFORM_URL_${D_ENV}`

echo "URL:${val_WORKER_PLATFORM_URL}"

curl -d '{"code":"'${RELEASE_NAME}'","assetsPath":"'${SUB_PATH}'","assets":"'${assets}'","status": 2, "version":"'${CHART_VERSION}'"}' -H "Content-Type: application/json" -X POST  ${val_WORKER_PLATFORM_URL}/global/menu/v1/menu-resources

