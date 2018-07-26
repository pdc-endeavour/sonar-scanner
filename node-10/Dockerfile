# Use the master built docker image for supplying the sonar-scanner executable
FROM infosupport/sonar-scanner:latest as sonar-scanner

# Base this image on node 10 to enable analysis of for example TypeScript files
FROM node:10-alpine

# Copy the sonarqube executable to this image
COPY --from=sonar-scanner /usr/bin/sonar-scanner /usr/bin/sonar-scanner

# Copy the jar file needed to run the sonarqube scanner
COPY --from=sonar-scanner /usr/lib/sonar-scanner-cli-* /usr/lib/
