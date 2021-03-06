#!/bin/bash

executing_dir()
{
        dirname `readlink -f "$0"`
}
exdir=`executing_dir`
PATH="$exdir"/../utils:$PATH
source "$exdir"/../utils/utils.sh

container=`cat "$exdir"/imgdata/container`

dk-rm-if-exists $container

if [ ! -e $HOME/nuget-packages ]; then mkdir $HOME/nuget-packages; fi

docker -D run \
        -d \
        -ti \
	--volume=$HOME/nuget-packages:/root/nuget-packages \
	--volume=$exdir/../opensource:/nas/opensource \
	--network=dknet18 \
	-e TZ=`cat /etc/timezone` \
        -h $container \
        --name $container \
        searchathing/$container

docker logs -f searchathing

