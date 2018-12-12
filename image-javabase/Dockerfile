FROM openjdk:8u181-jre-alpine3.8
  
LABEL maintainer="dongbin <dongbin@xforceplus.com>"

# Replace the actual Java executable.
COPY ["./java.sh","${JAVA_HOME}/bin"]
# Code monitoring report
COPY ["./jacocoagent.jar","/usr/local/share"]
COPY ["./pre-stop.sh","/pre-stop.sh"]
COPY ["./run-app.sh", "/run-app.sh"]
ADD skywalking-agent.tar.gz /usr/local/share

# Skywalking invokes the client agent path monitored by the chain.
ENV SKYWALKING_AGENT=/usr/local/share/skywalking-agent/skywalking-agent.jar
# The jacoco test covers the agent path.
ENV JACOCO_AGENT=/usr/local/share/jacocoagent.jar
ENV TZ=Asia/Shanghai

RUN mv ${JAVA_HOME}/bin/java ${JAVA_HOME}/bin/xjava && \
    chmod +x ${JAVA_HOME}/bin/java.sh && \
    chmod -R 777 /usr/local/share/skywalking-agent/logs && \
    chmod +x /pre-stop.sh && \
    chmod +x /run-app.sh && \
    ln -s ${JAVA_HOME}/bin/java.sh ${JAVA_HOME}/bin/java && \
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    apk add --update --no-cache tzdata maven \
                                 curl \
                                 busybox-extras && \
    cp /usr/share/zoneinfo/${TZ} /etc/localtime && \
    echo "${TZ}" > /etc/timezone
