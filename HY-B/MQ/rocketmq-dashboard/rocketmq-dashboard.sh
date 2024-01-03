#!/bin/sh

## chang here
SERVICE_NAME=rocketmq-dashboard-1.0.1-SNAPSHOT

case "$1" in
	start)
		procedure=`ps -ef | grep -w "${SERVICE_NAME}" |grep -w "java"| grep -v "grep" | awk '{print $2}'`
		if [ "${procedure}" = "" ];
		then
			echo "start ..."
			exec nohup java -Xms64m -Xmx128m -jar ${SERVICE_NAME}\.jar --server.port=20080 >/dev/null 2>&1 &
			echo "start success"
		else
			echo "${SERVICE_NAME} is start"
		fi
		;;

	stop)
		procedure=`ps -ef | grep -w "${SERVICE_NAME}" |grep -w "java"| grep -v "grep" | awk '{print $2}'`
		if [ "${procedure}" = "" ];
		then
			echo "${SERVICE_NAME} is stop"
		else
			kill -9 ${procedure}
			sleep 1
			argprocedure=`ps -ef | grep -w "${SERVICE_NAME}" |grep -w "java"| grep -v "grep" | awk '{print $2}'`
			if [ "${argprocedure}" = "" ];
			then
				echo "${SERVICE_NAME} stop success"
			else
				kill -9 ${argprocedure}
				echo "${SERVICE_NAME} stop error"
			fi
		fi
		;;

	restart)
		$0 stop
		sleep 1
		$0 start $2
		;;

	*)
		echo "usage: $0 [start|stop|restart]"
		;;
esac