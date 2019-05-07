ARG UBUNTU_VERSION=18.04
FROM bitsandscraps/aiwc:base-python3-cuda-10.0-ubuntu-${UBUNTU_VERSION}

WORKDIR /root

COPY extlibs ./extlibs
COPY worlds ./worlds
COPY protos ./protos
COPY plugins ./plugins
COPY controllers ./controllers
COPY config.json ./
