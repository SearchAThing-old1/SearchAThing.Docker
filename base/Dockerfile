FROM ubuntu:xenial

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

#--[ apt transport https ]
RUN apt-get update
RUN apt-get install -y apt-transport-https apt-utils

#--[ basic utils ]
RUN apt-get update
RUN apt-get install -y mc
RUN apt-get install -y nano less vim
RUN apt-get install -y inetutils-ping dnsutils net-tools telnet curl
RUN apt-get install -y man-db manpages
RUN apt-get install -y bash-completion

RUN apt-get install -y uuid
RUN apt-get install -y psmisc
RUN apt-get install -y sudo

RUN apt-get install -y net-tools telnet curl cifs-utils
RUN apt-get install -y git libtool
RUN apt-get install -y zip
RUN apt-get install -y dos2unix

#--[ rsyslog ]
RUN apt-get install -y rsyslog

#--[ supervisor ]
RUN apt-get install -y supervisor

#====================================================================
# bashrc
#====================================================================

COPY imgdata/container /root/.container

RUN echo 'if [ -f /etc/bash_completion ] && ! shopt -oq posix; then' >> /tmp/bash.bashrc
RUN echo '    . /etc/bash_completion' >> /tmp/bash.bashrc
RUN echo 'fi' >> /tmp/bash.bashrc
RUN echo 'export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\u@\h[`cat /root/.container`]:\w# "' >> /tmp/bash.bashrc
RUN echo "alias mv='mv -i'" >> /tmp/bash.bashrc
RUN echo "alias rm='rm -i'" >> /tmp/bash.bashrc
RUN echo "alias cp='cp -i'" >> /tmp/bash.bashrc
RUN echo 'export PATH=/nas/scripts/utils:$PATH' >> /tmp/bash.bashrc

RUN cat /tmp/bash.bashrc >> /etc/bash.bashrc
RUN cat /tmp/bash.bashrc >> /root/.bashrc

ENV HISTSIZE=100000

#--[ entrypoint & cmd ]

COPY imgdata/entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/bin/bash","--login"]
