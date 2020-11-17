FROM maven:3.5.2-jdk-8-alpine

ENV HELM_VERSION="v2.8.2" \
    YQ_VERSION="2.1.1"
RUN apk --no-cache add \
    docker \
    mysql-client \
    xmlstarlet \
    openssl \
    ca-certificates \
    openssh \
    git \
    jq 

# install ant
WORKDIR /tmp

ENV ANT_VERSION=1.10.2
ENV ANT_HOME=/usr/share/ant

RUN wget http://archive.apache.org/dist/ant/binaries/apache-ant-${ANT_VERSION}-bin.tar.gz \
    && tar -zvxf apache-ant-${ANT_VERSION}-bin.tar.gz -C /usr/share/ >> /dev/null \
    && ln -s /usr/share/apache-ant-${ANT_VERSION} /usr/share/ant \
    && rm -f apache-ant-${ANT_VERSION}-bin.tar.gz \
    && ln -s /usr/share/ant/bin/ant /usr/bin/ant



WORKDIR /root

RUN wget -O /usr/bin/yq \
    "https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_amd64" && \
    chmod +x /usr/bin/yq  && \
    wget "https://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz" && \
    tar xzf "helm-${HELM_VERSION}-linux-amd64.tar.gz" -C /tmp && \
    rm -r "helm-${HELM_VERSION}-linux-amd64.tar.gz" && \
    mv /tmp/linux-amd64/helm /usr/bin/helm && \
    helm init -c && \
    helm plugin install https://github.com/chartmuseum/helm-push --version v0.8.1
run cd /tmp/ && \
        wget --no-check-certificate -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
        wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.31-r0/glibc-2.31-r0.apk && \
        wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.31-r0/glibc-bin-2.31-r0.apk && \
        wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.31-r0/glibc-i18n-2.31-r0.apk && \
        apk add glibc-2.31-r0.apk glibc-bin-2.31-r0.apk glibc-i18n-2.31-r0.apk && \
        /usr/glibc-compat/bin/localedef -i en_US -f UTF-8 en_US.UTF-8 && \
        rm -rf /tmp/* && \
        cd - && \
        curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
        chmod +x /usr/local/bin/docker-compose && \
        ln -sf /usr/local/bin/docker-compose /usr/bin/docker-compose