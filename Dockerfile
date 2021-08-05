FROM ubuntu:focal
LABEL maintainer="jerome.gasperi@gmail.com"

# Add wait-for-it
ADD https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh /bin/wait-for-it.sh
RUN chmod +x /bin/wait-for-it.sh

# Add S6 supervisor (for graceful stop)
ADD https://github.com/just-containers/s6-overlay/releases/download/v2.2.0.3/s6-overlay-amd64.tar.gz /tmp/
RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C / --exclude='./bin' && \
	tar xzf /tmp/s6-overlay-amd64.tar.gz -C /usr ./bin && \
	rm -rf /tmp/*
ENTRYPOINT ["/init"]
