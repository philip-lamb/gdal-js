FROM ubuntu:20.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install \ 
    build-essential \
    cmake \
    autoconf \
    python3 \
    nodejs \
    default-jre \
    libtool \
    curl \
    git-core \
    zip

WORKDIR /opt
RUN git clone https://github.com/emscripten-core/emsdk.git

WORKDIR /opt/emsdk

# Emscripten's version selection / activation was flaky the last time I tried it, but
# leaving this variable in place in case it's ever possible to resurrect it.
# In that case, replace "latest" below with "${EMSCRIPTEN_V}".
ARG EMSCRIPTEN_V

RUN ./emsdk install latest
RUN ./emsdk activate latest

RUN git config --global user.name 'Nobody'
RUN git config --global user.email 'nobody@nowhere.nope'

RUN mkdir /opt/gdaljs

WORKDIR /opt
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

WORKDIR /opt/gdaljs

ENTRYPOINT ["/opt/entrypoint.sh"]
