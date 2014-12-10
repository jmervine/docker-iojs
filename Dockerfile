FROM buildpack-deps

RUN apt-get update && apt-get install -y \
        ca-certificates \
        curl \
        git

ENV IOJS_VERSION 0.10

WORKDIR /tmp
RUN git clone https://github.com/iojs/io.js.git

WORKDIR /tmp/io.js

RUN git checkout v$IOJS_VERSION
RUN ./configure
RUN make
RUN make install

# Cleanup
WORKDIR /
RUN rm -rf /tmp/io.js

CMD [ "node" ]

