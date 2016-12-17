#!/bin/bash

# one time only actions
if [ ! -e /var/lib/docker-entrypoint/.entrypoint-develbase-executed ]; then
	touch /var/lib/docker-entrypoint/.entrypoint-develbase-executed
fi

# every run actions
