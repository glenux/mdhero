FROM debian:stable

MAINTAINER Glenn Y. Rolland <glenux@glenux.net>

RUN apt-get update && \
	apt-get install -y make && \
	apt-get install -y mkdocs && \
	apt-get install -y nodejs-legacy nodejs && \
	apt-get autoremove 

COPY tools /tools

RUN mkdir -p /formation
WORKDIR /formation

EXPOSE 4000
EXPOSE 4001

CMD /usr/bin/make
