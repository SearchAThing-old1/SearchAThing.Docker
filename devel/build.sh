#!/bin/bash

executing_dir()
{
        dirname `readlink -f "$0"`
}

exdir=`executing_dir`
container=`cat $exdir/imgdata/container`

#--[ build image ]

proxy_args=""
if [ "x$http_proxy" != "x" ]; then
	proxy_args="--build-arg http_proxy=$http_proxy --build-arg https_proxy=$https_proxy"
fi

docker build $proxy_args $@ -t searchathing/$container "$exdir"
