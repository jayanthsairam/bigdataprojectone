#!/bin/bash
echo "welcome "
start=`date +%s`
date -d @$start
RUN_DATE=$1
echo "we are running on ${RUN_DATE}"
PHASE=$2
source /home/srinivasatulam6597/ashok/python/practice_24-12/Rpa_data_mediation_${PHASE}.properties
#echo "username is :- ${USERNAME}"
#echo "password is :- ${password}"
echo "##Script log File Location:-${LOG_DIR}/${LOG_FILE}"
echo >${LOG_DIR}/${LOG_FILE}
sqoop import  "-Dorg.apache.sqoop.splitter.allow_text_splitter=true" --connect ${URL} --username ${USERNAME} --password ${password} --table EMPLOYEE --split-by EMPNO --as-textfile --ta
rget-dir ${TGT_DIR} --delete-target-dir
if [ $? -ne 0 ] ; then
echo "job got failed due to error in import statement | tee -a ${LOG_DIR}/${LOG_FILE}"
exit -100
fi
