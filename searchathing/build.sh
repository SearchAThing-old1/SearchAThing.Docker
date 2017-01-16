#!/bin/bash

executing_dir()
{
        dirname `readlink -f "$0"`
}

exdir=`executing_dir`
container=`cat $exdir/imgdata/container`

#--[ build image ]
docker build $@ -t searchathing/$container "$exdir"
