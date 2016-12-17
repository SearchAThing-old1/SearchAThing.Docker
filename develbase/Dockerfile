FROM searchathing/mono

ENV DKHOST develbase

#--[ gcc ]
RUN \
	apt-get install -y build-essential gcc g++ automake autoconf && \
#--[ npm ]
	apt-get install -y npm && \
#--[ python anaconda ]
	apt-get update --fix-missing && \
	apt-get install -y wget bzip2 ca-certificates libglib2.0-0 libxext6 libsm6 libxrender1 git mercurial subversion && \
        echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
	wget --quiet https://repo.continuum.io/archive/Anaconda2-4.1.1-Linux-x86_64.sh -O ~/anaconda.sh && \
	/bin/bash ~/anaconda.sh -b -p /opt/conda && \
	rm ~/anaconda.sh

ENV PATH /opt/conda/bin:$PATH

RUN sed -i 's/\(PATH="\)\(.*\)\("\)/\1\2:\/opt\/conda\/bin\3/' /etc/environment

#--[ python env py3k ]
RUN \
	conda create -y -n py3k python=3 anaconda && \
#--[ mongo clients ]
	apt-get install -y mongodb-clients && \
#--[ postgresql clients ]
	apt-get install -y postgresql-client && \
	apt-get install -y postgresql-autodoc

COPY imgdata/postgresql_autodoc*.tmpl /usr/share/postgresql_autodoc

#======================================================================

#--[ entrypoint & cmd ]

COPY imgdata/entrypoint.sh /entrypoint.d/30-entrypoint-develbase.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/bin/bash","--login"]
