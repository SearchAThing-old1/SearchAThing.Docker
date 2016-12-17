#!/bin/bash

# one time only actions
if [ ! -e /var/lib/docker-entrypoint/.entrypoint-mono-executed ]; then
	touch /var/lib/docker-entrypoint/.entrypoint-mono-executed
fi

# every run actions
