FROM debian:latest
WORKDIR /app
RUN apt-get update && apt-get install -y \
  autoconf \
  bash \
  g++ \
  git \
  libicu-dev \
  libperl-dev \
  libssl-dev \
  make \
  pkg-config \
  python3-dev \
  swig \
  tcl-dev \
  gosu
COPY build-znc.sh /app
RUN ["./build-znc.sh"]
COPY run-znc.sh /app
COPY entrypoint.sh /app

ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["/usr/local/bin/znc", "-f"]
