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

RUN \
#--[ mono-complete ]
        apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
        echo "deb http://download.mono-project.com/repo/debian wheezy main" | tee /etc/apt/sources.list.d/mono-xamarin.list && \
        apt-get update && \
        apt-get install -y mono-complete && \
        echo "DOTNET_CLI_TELEMETRY_OPTOUT=1" >> /etc/environment && \
#--[ pcl assemblies ]
        apt-get install referenceassemblies-pcl

COPY imgdata/mono.machine.config.patch /tmp/patch

RUN \
	#--[ mono db provider npgsql ]
        cd /tmp; sed -i -e '/<add name="Sybase Data Provider"    invariant="Mono.Data.SybaseClient"/r patch' -e "s///" /etc/mono/4.5/machine.config && \
        \rm -f /tmp/patch

#--[ remove ioctl bashrc ]
RUN \
	sed -i 's#\(mesg n || true\)#\#\1#g' /root/.profile


ENV NVM_DIR=/root/.nvm

#--[ node version manager ]
RUN \
	/bin/bash -c "curl https://raw.githubusercontent.com/creationix/nvm/v0.25.0/install.sh | bash && source $NVM_DIR/nvm.sh && nvm install node"

RUN \
	echo "nvm use node" >> ~/.bashrc

#======================================================================

#--[ entrypoint & cmd ]

COPY imgdata/entrypoint.sh /entrypoint.d/30-entrypoint-devel.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/bin/bash","--login"]
