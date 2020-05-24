#!/usr/bin/bash
cd ../public
LISINING_HOST='127.0.0.1'
LISINING_PORT='8001'
php -S ${LISINING_HOST}:${LISINING_PORT} nohup command & >>out.txt 2>&1

ti1=`date +%s`    #获取时间戳
ti2=`date +%s`
i=$(($ti2 - $ti1 ))

while [[ "$i" -ne "1" ]]
do
	ti2=`date +%s`
	i=$(($ti2 - $ti1 ))
done

swoole_woker=`netstat -tunlp| grep ${LISINING_PORT}`
echo ${swoole_woker}
if [ ! -z "${swoole_woker}" ]; then
echo successfull
echo -e '\003:'
else
echo start fail
echo -e '\003:'
fi

