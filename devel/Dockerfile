FROM searchathing/develbase

ENV DKHOST=devel PATH=/opt/nuget:$PATH

RUN \
#--[ dkhost ]
	env-set-dkhost devel && \
#--[ nuget ]
	env-path-append /opt/nuget && \
        mkdir /opt/nuget && wget -O /opt/nuget/nuget.exe https://dist.nuget.org/win-x86-commandline/latest/nuget.exe && \
        echo 'mono /opt/nuget/nuget.exe "$@"' > /opt/nuget/nuget && chmod +x /opt/nuget/nuget && \
        mkdir -p /root/.config/NuGet

COPY imgdata/.config/NuGet/NuGet.Config /root/.config/NuGet

#--[ pcl assemblies ]
RUN \
        echo "deb http://download.mono-project.com/repo/debian wheezy main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list && \
        apt-get update && \
        apt-get install referenceassemblies-pcl && \
#--[ monodevelop ]
        apt-get install -y monodevelop


#======================================================================

#--[ entrypoint & cmd ]

COPY imgdata/entrypoint.sh /entrypoint.d/30-entrypoint-develbase.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/bin/bash","--login"]
