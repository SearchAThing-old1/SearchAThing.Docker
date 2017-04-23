#!/bin/bash

executing_dir()
{
        dirname `readlink -f "$0"`
}

exdir=`executing_dir`

cd $exdir/base && ./build.sh $@ && \
cd $exdir/develbase && ./build.sh --no-cache $@ && \
cd $exdir/devel && ./build.sh --no-cache $@


#cd $exdir && ./checkout_sources.sh && \
#cd $exdir/searchathing && ./build.sh

