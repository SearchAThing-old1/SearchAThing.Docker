#!/bin/bash

# one time only actions
if [ ! -e /var/lib/docker-entrypoint/.entrypoint-base-executed ]; then
	touch /var/lib/docker-entrypoint/.entrypoint-base-executed
fi

# every time actions
service supervisor start
service rsyslog start
