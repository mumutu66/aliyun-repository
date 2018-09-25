FROM node:8.11.4-alpine
RUN apk add --no-cache \
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
    git
RUN pip install pymysql pyyaml && npm install -g cnpm
RUN wget -O /usr/local/sass-binding https://github.com/sass/node-sass/releases/download/v4.9.3/linux-x64-57_binding.node
RUN export SASS_BINARY_PATH=/usr/local/sass-binding