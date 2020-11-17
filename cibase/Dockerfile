from  registry.cn-hangzhou.aliyuncs.com/choerodon-tools/cibase:0.6.0
RUN apk update 
RUN apk add openjdk11 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
RUN sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose