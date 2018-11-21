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
    jq

# install ant
WORKDIR /tmp

ENV ANT_VERSION=1.10.2
ENV ANT_HOME=/usr/share/ant

RUN wget http://archive.apache.org/dist/ant/binaries/apache-ant-${ANT_VERSION}-bin.tar.gz \
    && tar -zvxf apache-ant-${ANT_VERSION}-bin.tar.gz -C /usr/share/ \
    && ln -s /usr/share/apache-ant-${ANT_VERSION} /usr/share/ant \
    && rm -f apache-ant-${ANT_VERSION}-bin.tar.gz \

RUN wget -O /usr/bin/yq \
    "https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_amd64" && \
    chmod +x /usr/bin/yq  && \
    wget "https://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz" && \
    tar xzf "helm-${HELM_VERSION}-linux-amd64.tar.gz" -C tmp && \
    rm -r "helm-${HELM_VERSION}-linux-amd64.tar.gz" && \
    mv /tmp/linux-amd64/helm /usr/bin/helm && \
    helm init -c && \
    helm plugin install https://github.com/chartmuseum/helm-push