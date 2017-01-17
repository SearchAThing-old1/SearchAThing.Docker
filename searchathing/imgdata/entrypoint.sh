#!/bin/bash

# one time only actions
if [ ! -e /var/lib/docker-entrypoint/.entrypoint-searchathing-executed ]; then
	cd /nas/opensource/SearchAThing.Sci && \
        nuget restore && \
        xbuild && \
        cd /tmp && mono /nas/opensource/SearchAThing.Sci/src/Example/ConsoleApp1/bin/Debug/ConsoleApp1.exe && ls -la output.dxf && \
	echo "press ctrl+c to exit docker logs -f" && \
	echo "run 'dk-exec searchathing' to enter container"

	touch /var/lib/docker-entrypoint/.entrypoint-searchathing-executed
fi

# every run actions
