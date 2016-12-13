#!/bin/bash

if [ ! -e /root/.entrypoint-executed ]; then

	touch /root/.entrypoint-executed
fi

service ssh start
service supervisor start
service rsyslog start

$1
