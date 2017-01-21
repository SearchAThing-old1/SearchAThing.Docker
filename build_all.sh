#!/bin/bash

executing_dir()
{
        dirname `readlink -f "$0"`
}

exdir=`executing_dir`

cd $exdir/base && ./build.sh && \
cd $exdir/mono && ./build.sh && \
cd $exdir/develbase && ./build.sh && \
cd $exdir/devel && ./build.sh

#cd $exdir && ./checkout_sources.sh && \
#cd $exdir/searchathing && ./build.sh

