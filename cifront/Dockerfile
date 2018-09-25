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
    libpng-devel \
    git
RUN pip install pymysql pyyaml && npm install -g cnpm
RUN curl -o /usr/local/sass-binding  -L https://github.com/sass/node-sass/releases/download/v4.9.3/linux-x64-57_binding.node
RUN export SASS_BINARY_PATH=/usr/local/sass-binding