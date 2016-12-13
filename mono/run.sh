#!/bin/bash

executing_dir()
{
        dirname `readlink -f "$0"`
}
exdir=`executing_dir`
PATH="$exdir"/../utils:$PATH
source "$exdir"/../utils/utils.sh

container=`cat imgdata/container`

dk-rm-if-exists $container

docker -D run \
        -d \
        -ti \
	--network=dknet18 \
	-e TZ=`cat /etc/timezone` \
        -h $container \
        --name $container \
        searchathing/$container
