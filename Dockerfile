FROM ubuntu:trusty
MAINTAINER Maxime Werlen

WORKDIR /tmp/amv-ffmpeg

RUN apt-get update && apt-get install -y build-essential curl nasm tar bzip2 \
  zlib1g-dev libssl-dev yasm libmp3lame-dev libogg-dev libx264-dev libvpx-dev libvorbis-dev libass-dev libwebp-dev libtheora-dev libopus-dev && \
  rm -rf /var/lib/apt/lists/*

RUN DIR=$(mktemp -d) && cd ${DIR} && \
  curl -s https://codeload.github.com/vsubhash/amv-ffmpeg/legacy.tar.gz/5badb35c4f44cf86695fcab3b58bf947eb912150 | tar xzvf - -C . && \
  cd vsubhash-amv-ffmpeg-5badb35 && \
  ./configure && \
  make && \
  make install && \
  rm -rf ${DIR}

ENTRYPOINT ["amv-ffmpeg"]
