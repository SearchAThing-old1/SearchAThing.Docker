#!/bin/bash

# one time only actions
if [ ! -e /var/lib/docker-entrypoint/.entrypoint-devel-executed ]; then
	touch /var/lib/docker-entrypoint/.entrypoint-devel-executed
fi

# every run actions
