FROM sonar-scanner as sonar-scanner

FROM node:10-alpine
COPY --from=sonar-scanner /usr/bin/sonar-scanner /usr/bin/sonar-scanner
