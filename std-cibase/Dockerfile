FROM maven:3.6.3-jdk-8


ENV HELM_VERSION="v2.8.2" \
    YQ_VERSION="2.1.1"

run apt-get update &&\
      apt-get install -y mariadb-client && \
      apt-get install -y xmlstarlet && \
      apt-get install -y openssh-server && \
      apt-get install -y jq 

RUN curl -fsSL https://get.docker.com -o get-docker.sh
RUN sh get-docker.sh


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

RUN curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose