#!/bin/bash

val=`eval echo '$'JAVA_OPTS_${JAVA_D_ENV}`

if [[ ${JAVA_D_ENV} == FAT ]];then
  java $val -javaagent:${JACOCO_AGENT}=destfile=/Charts/reports/jacoco.exec  -javaagent:${SKYWALKING_AGENT} -jar app.jar
else
  java $val -jar app.jar
fi
