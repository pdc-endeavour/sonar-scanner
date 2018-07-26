FROM openjdk:8-jre-alpine

RUN sonarScannerVersion=3.2.0.1227 \
 && cd / \
 && wget https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-$sonarScannerVersion.zip \
 && unzip sonar-scanner-cli-$sonarScannerVersion.zip \
 && rm sonar-scanner-cli-$sonarScannerVersion.zip \
 && ln -s $sonarScannerPath/sonar-scanner /usr/bin/
