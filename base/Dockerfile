FROM ubuntu:xenial

ENV DKHOST=base HOME=/root DEBIAN_FRONTEND=noninteractive

#--[ update-dkhost, env-path-prepend, env-path-append ]
COPY imgdata/bin/* /bin/

RUN \
#--[ DKHOST ]
	env-set-dkhost base && \
#--[ apt transport https locales ]
	apt-get update && \
	apt-get install -y apt-transport-https apt-utils && \
	locale-gen en_US.UTF-8 && \
	dpkg-reconfigure locales

ENV LANGUAGE=en_US:en LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8

RUN \
	echo "LANGUAGE=en_US:en" >> /etc/environment && \
        echo "LANG=en_US.UTF-8" >> /etc/environment && \
        echo "LC_ALL=en_US.UTF-8" >> /etc/environment && \
	locale-gen en_US.UTF-8 && dpkg-reconfigure locales && \
#--[ basic utils ]
	apt-get update && \
	apt-get install -y mc && \
	apt-get install -y nano less vim && \
	apt-get install -y inetutils-ping dnsutils net-tools telnet curl && \
	apt-get install -y man-db manpages && \
	apt-get install -y bash-completion && \
	apt-get install -y locate ; updatedb && \
	apt-get install -y uuid && \
	apt-get install -y psmisc && \
	apt-get install -y sudo && \
	apt-get install -y net-tools telnet curl cifs-utils && \
	apt-get install -y git libtool && \
	apt-get install -y zip && \
	apt-get install -y dos2unix && \
#--[ rsyslog ]
	apt-get install -y rsyslog && \
#--[ supervisor ]
	apt-get install -y supervisor

#====================================================================
# bashrc
#====================================================================

RUN \
	echo 'PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\u@\h[$DKHOST]:\w# "' >> /etc/environment && \
	echo 'export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\u@\h[$DKHOST]:\w# "' >> /tmp/bash.bashrc && \
	echo 'if [ -f /etc/bash_completion ] && ! shopt -oq posix; then' >> /tmp/bash.bashrc && \
	echo '    . /etc/bash_completion' >> /tmp/bash.bashrc && \
	echo 'fi' >> /tmp/bash.bashrc && \
	echo "alias mv='mv -i'" >> /tmp/bash.bashrc && \
	echo "alias rm='rm -i'" >> /tmp/bash.bashrc && \
	echo "alias cp='cp -i'" >> /tmp/bash.bashrc && \
	cat /tmp/bash.bashrc >> /etc/bash.bashrc && \
	cat /tmp/bash.bashrc >> /root/.bashrc && \
#--[ /entrypoint.d, /var/lib/docker-entrypoint folders ]
	mkdir /entrypoint.d /var/lib/docker-entrypoint

#--[ entrypoint & cmd ]
COPY imgdata/entrypoint.sh /
COPY imgdata/entrypoint-base.sh /entrypoint.d/10-base.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/bin/bash","--login"]
