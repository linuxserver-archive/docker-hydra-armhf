FROM lsioarmhf/base.python
MAINTAINER sparklyballs

# set python to use utf-8 rather than ascii
ENV PYTHONIOENCODING="UTF-8"

# copy local files
COPY root/ /

# ports and volumes
EXPOSE 5075
# WORKDIR /config/hydra
VOLUME /config /downloads
