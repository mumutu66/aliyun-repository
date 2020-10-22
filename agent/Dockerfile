FROM alpine:3.9.6
RUN apk --no-cache add \
        git \
        tini \
        curl \
        bash \
        tzdata \
        openssh \
        ca-certificates && \
    mkdir -p /ssh-keys && \
    wget -qO /usr/bin/kubectl \
       "http://mirror.azure.cn/kubernetes/kubectl/$(curl -sSL http://mirror.azure.cn/kubernetes/kubectl/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod a+x /usr/bin/kubectl && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone
