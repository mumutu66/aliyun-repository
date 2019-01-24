FROM node:10.11.0-alpine
RUN apk add --update --no-cache \
    bash \
    curl \
    python2 \
    py2-pip \
    python2-dev \
    build-base \
    musl-dev \
    libffi-dev \
    openssl-dev \
    nasm \
    autoconf \
    automake \
    lcms2-dev \
    libpng-dev \
    libtool \
    tar \
    git
RUN pip install pymysql pyyaml && npm install -g cnpm
RUN wget https://dl.minio.io/client/mc/release/linux-amd64/mc
RUN chmod +x mc
ADD addRelease.sh /addRelease.sh
#RUN curl -o /usr/local/sass-binding  -L https://github.com/sass/node-sass/releases/download/v4.9.3/linux-x64-57_binding.node
#RUN export SASS_BINARY_PATH=/usr/local/sass-binding