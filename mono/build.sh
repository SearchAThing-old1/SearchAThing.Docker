#!/bin/bash

source /nas/scripts/utils.sh

exdir=`executing_dir`
container=`cat $exdir/imgdata/container`

#--[ build image ]
docker build -t searchathing/$container "$exdir"
