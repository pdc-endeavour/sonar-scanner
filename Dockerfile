FROM openjdk:8-jre-alpine

RUN sonarScannerVersion=3.2.0.1227 \
 && cd / \
 && wget https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-$sonarScannerVersion.zip \
 && unzip sonar-scanner-cli-$sonarScannerVersion.zip \
 && rm sonar-scanner-cli-$sonarScannerVersion.zip \
 && mv /sonar-scanner-$sonarScannerVersion/bin/sonar-scanner /usr/bin/ \
 && mv /sonar-scanner-$sonarScannerVersion/lib/sonar-scanner-cli-$sonarScannerVersion.jar /usr/lib/sonar-scanner-cli-$sonarScannerVersion.jar \
 && rm -r /sonar-scanner-$sonarScannerVersion/
