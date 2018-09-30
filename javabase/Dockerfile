FROM alpine:3.7
# Install base packages
RUN apk add --no-cache \
    curl \
    bash \
    tree \
    tzdata \
    openjdk8-jre \
    maven \
    ttf-droid
# Modify timezone
RUN cp -rf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
COPY jacocoagent.jar /jacocoagent.jar
COPY pre-stop.sh /pre-stop.sh
RUN chmod +x /pre-stop.sh