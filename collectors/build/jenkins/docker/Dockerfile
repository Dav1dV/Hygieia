
FROM docker.io/openjdk:8-jre

MAINTAINER Hygieia@capitalone.com

RUN mkdir /hygieia /hygieia/config

COPY *.jar /hygieia/
COPY properties-builder.sh /hygieia/

WORKDIR /hygieia

VOLUME ["/hygieia/logs"]

ENV PROP_FILE /hygieia/config/application.properties

#CMD /mnt/jenkins-java-import-cert.sh  && \
#  ./properties-builder.sh && \
#  java -jar jenkins-build-collector*.jar --spring.config.location=$PROP_FILE
CMD ./properties-builder.sh && \
  java -jar jenkins-build-collector*.jar --spring.config.location=$PROP_FILE

