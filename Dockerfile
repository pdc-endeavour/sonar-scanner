FROM openjdk:8-jre-alpine

RUN sonarScannerVersion=3.2.0.1227 \
 && sonarScannerPath=/sonar-scanner-$sonarScannerVersion/bin \
 && cd / \
 && wget https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-$sonarScannerVersion.zip \
 && unzip sonar-scanner-cli-$sonarScannerVersion.zip \
 && rm sonar-scanner-cli-$sonarScannerVersion.zip \
 && mv $sonarScannerPath/sonar-scanner /usr/bin/ \
 && rm -r /sonar-scanner-$sonarScannerVersion/
