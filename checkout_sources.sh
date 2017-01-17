#!/bin/bash

executing_dir()
{
        dirname `readlink -f "$0"`
}

exdir=`executing_dir`

if [ ! -e $exdir/opensource ]; then mkdir $exdir/opensource; fi

cd $exdir/opensource

# clone_repo <name> <url> [<origin>]
clone_repo()
{
	echo
	echo "---> repo [$1]"

	if [ ! -e "$1" ]; then
		mkdir "$1"
		if [ "x$3" != "x" ]; then
			# branch specific
			git clone -b "$3" "$2" "$1"
		else
			git clone "$2" "$1"
		fi
	else
		# existing working copy
		cd $1
		if [ "x$3" != "x" ]; then
			# branch specific
			git pull origin $3
		else
			git pull
		fi
		cd ..
	fi
}

clone_repo clipper https://github.com/swsglobal/clipper.git && \
clone_repo DotSpatial https://github.com/swsglobal/DotSpatial.git && \
clone_repo MIConvexHull https://github.com/DesignEngrLab/MIConvexHull.git && \
clone_repo netdxf_mono https://github.com/devel0/netdxf.clone.git no_presentation_core && \
clone_repo xamlmapcontrol https://git01.codeplex.com/forks/ldelana/xamlmapcontrol && \
clone_repo SearchAThing.Core https://github.com/devel0/SearchAThing.Core.git && \
clone_repo SearchAThing.Sci https://github.com/devel0/SearchAThing.Sci.git
