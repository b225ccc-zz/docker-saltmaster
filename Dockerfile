FROM ubuntu:14.04

MAINTAINER b225ccc@gmail.com

# install dependencies
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y software-properties-common && \
  add-apt-repository -y ppa:saltstack/salt && \
  apt-get update && \
  apt-get install -y \
    salt-master \
    salt-cloud \
    salt-api \
    supervisor && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN \
  mkdir -p /var/log/supervisor

# add custom files
COPY run.sh /usr/local/bin/run.sh
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN chmod +x /usr/local/bin/run.sh

# volumes
VOLUME /salt

# ports
EXPOSE 4505 4506 443

CMD ["/usr/local/bin/run.sh"]
