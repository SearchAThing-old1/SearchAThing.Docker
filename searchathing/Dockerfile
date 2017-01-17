FROM searchathing/devel

ENV DKHOST=searchathing PATH=/opt/nuget:$PATH

# see entrypoint

#======================================================================

#--[ entrypoint & cmd ]

COPY imgdata/entrypoint.sh /entrypoint.d/30-entrypoint-searchathing.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/bin/bash","--login"]
