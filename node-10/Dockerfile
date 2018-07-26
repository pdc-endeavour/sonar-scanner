# Use the master built docker image for supplying the sonar-scanner executable
FROM infosupport/sonar-scanner:latest as sonar-scanner

# Base this image on node 10 to enable analysis of for example TypeScript files
FROM node:10-alpine

# Add nss to enable the sonar-scanner to find /usr/lib/libnss3.so
# RUN apk add --no-cache nss

# Install JRE
ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk/jre
ENV PATH $PATH:$JAVA_HOME/bin
ENV JAVA_VERSION 8u171
ENV JAVA_ALPINE_VERSION 8.171.11-r0
RUN apk add --no-cache openjdk8-jre="$JAVA_ALPINE_VERSION"

# Copy the sonar-scanner executable to this image
COPY --from=sonar-scanner /sonar-scanner/ /sonar-scanner/

# Set the path to the sonar-scanner
ENV PATH=$PATH:/sonar-scanner/bin
