# Base this image on JRE 8 to enable the sonar-scanner to run
FROM adoptopenjdk/openjdk8:alpine

# Download and unzip the sonar-scanner
RUN sonarScannerVersion=4.0.0.1744 \
 && cd / \
 && wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-$sonarScannerVersion.zip \
 && unzip /sonar-scanner-cli-$sonarScannerVersion.zip \
 && rm /sonar-scanner-cli-$sonarScannerVersion.zip \
 && mv /sonar-scanner-$sonarScannerVersion /sonar-scanner

# Set the path to the sonar-scanner
ENV PATH=$PATH:/sonar-scanner/bin
