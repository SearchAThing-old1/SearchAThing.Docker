FROM searchathing/develbase

ENV DKHOST=searchathing PATH=/opt/nuget:$PATH

#--[ src pkgs ]
RUN \
	mkdir -p /nas/opensource && \
	cd /nas/opensource && \
	git clone https://github.com/swsglobal/clipper.git && \
	git clone https://github.com/swsglobal/DotSpatial.git && \
	git clone https://github.com/DesignEngrLab/MIConvexHull.git && \
	git clone -b no_presentation_core https://github.com/devel0/netdxf.clone.git netdxf_mono && \
	git clone https://git01.codeplex.com/forks/ldelana/xamlmapcontrol && \
	git clone https://github.com/devel0/SearchAThing.Core.git && \
	git clone https://github.com/devel0/SearchAThing.Sci.git

#--[ nuget ]
RUN \
        mkdir /opt/nuget && wget -O /opt/nuget/nuget.exe https://dist.nuget.org/win-x86-commandline/latest/nuget.exe && \
        echo 'mono /opt/nuget/nuget.exe "$@"' > /opt/nuget/nuget && chmod +x /opt/nuget/nuget && \
	mkdir -p /root/.config/NuGet

COPY imgdata/.config/NuGet/NuGet.Config /root/.config/NuGet

#--[ pcl assemblies ]
RUN \
	echo "deb http://download.mono-project.com/repo/debian wheezy main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list && \
	apt-get update && \
	apt-get install referenceassemblies-pcl

#--[ sample ]
RUN \
	cd /nas/opensource/SearchAThing.Sci && \
	nuget restore && \
	xbuild && \
	cd /tmp && mono /nas/opensource/SearchAThing.Sci/src/Example/ConsoleApp1/bin/Debug/ConsoleApp1.exe && ls -la output.dxf

#======================================================================

#--[ entrypoint & cmd ]

COPY imgdata/entrypoint.sh /entrypoint.d/30-entrypoint-develbase.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/bin/bash","--login"]
