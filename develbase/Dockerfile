FROM searchathing/base

RUN apt-get update

ENV DKHOST=develbase PATH=/opt/conda/bin:$PATH

RUN \
#--[ DKHOST ]
	env-set-dkhost develbase && \
#--[ gcc ]
	apt-get install -y build-essential gcc g++ automake autoconf && \
#--[ npm ]
	apt-get install -y npm && \
#--[ python anaconda ]
	apt-get install -y wget bzip2 ca-certificates libglib2.0-0 libxext6 libsm6 libxrender1 git mercurial subversion && \
	wget --quiet https://repo.continuum.io/archive/Anaconda2-4.1.1-Linux-x86_64.sh -O ~/anaconda.sh && \
	/bin/bash ~/anaconda.sh -b -p /opt/conda && \
	rm ~/anaconda.sh && \
	env-path-prepend /opt/conda/bin && \
#--[ python env py3k ]
	conda create -y -n py3k python=3 anaconda && \
#--[ mongo clients ]
	apt-get install -y mongodb-clients && \
#--[ postgresql clients ]
	apt-get install -y postgresql-client && \
	apt-get install -y postgresql-autodoc

RUN \
#--[ jq ]
	apt-get install -y jq
	
COPY imgdata/postgresql_autodoc*.tmpl /usr/share/postgresql_autodoc

#======================================================================

#--[ entrypoint & cmd ]

COPY imgdata/entrypoint.sh /entrypoint.d/30-entrypoint-develbase.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/bin/bash","--login"]
