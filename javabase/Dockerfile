FROM alpine:3.7
# Install base packages
RUN apk add --no-cache \
    curl \
    bash \
    tree \
    tzdata \
    openjdk8-jre \
    maven \
    unzip \
    ttf-droid
# Modify timezone
RUN cp -rf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
COPY jacocoagent.jar /jacocoagent.jar
COPY pom.xml /pom.xml
COPY pre-stop.sh /pre-stop.sh
ADD agent.zip /agent.zip
RUN unzip /agent.zip
RUN chmod +x /pre-stop.sh