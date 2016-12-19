FROM searchathing/base

#--[ env ]
ENV DKHOST=mono DOTNET_CLI_TELEMETRY_OPTOUT=1

#--[ mono db provider npgsql ]
COPY imgdata/mono.machine.config.patch /tmp/patch

RUN \
#--[ DKHOST ]
	env-set-dkhost mono && \
#--[ mono-complete ]
	apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
	echo "deb http://download.mono-project.com/repo/debian nightly main" | tee /etc/apt/sources.list.d/mono-nightly.list && \
	sudo apt-get update && \
	apt-get install -y mono-complete && \
	echo "DOTNET_CLI_TELEMETRY_OPTOUT=1" >> /etc/environment && \
#--[ mono db provider npgsql ]
	cd /tmp; sed -i -e '/<add name="Sybase Data Provider"    invariant="Mono.Data.SybaseClient"/r patch' -e "s///" /etc/mono/4.5/machine.config && \
	\rm -f /tmp/patch

#======================================================================

#--[ entrypoint & cmd ]

COPY imgdata/entrypoint.sh /entrypoint.d/20-entrypoint-mono.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/bin/bash","--login"]
