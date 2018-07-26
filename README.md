# sonar-scanner

In order to perform SonarQube scan's locally or on a buildserver you'll need a Sonar Scanner.

This sonar-scanner Docker image is specifically built for Jenkins Pipelines (Declarative syntax) with Docker steps.

More information about the executable `sonar-scanner` can be found on: https://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner

## Our coding standards

- DRY: We try to duplicate code as little as possible. That's why you see image inheritance between Dockerfiles within this repository.
- Minimal size: Always clean up temporary files in the same RUN statement to avoid large layers.
- KISS: Less code is easier to maintain.
- Secure: We never use insecure http requests and never ignore SSL faults.

## Examples

### Maven

If you would like to run a maven build using sonarqube. We suggest using `mvn sonar:sonar`.

### NPM/NodeJS

If you would like to perform a SonarQube analysis on an npm based build using Jenkins Docker steps, you can use the following construction:

```groovy
stage('npm') {
    steps {
        <run your regular npm build>
        // Stash all files needed for the sonarqube Analysis
        stash name: 'SonarQubeResultFiles', includes: 'sonar-project.properties,src/**/*,<other files you define in sonar-project.properties>'
    }
}

stage('SonarQube') {
    agent {
        // Run the SonarQube analysis with the sonar-scanner Docker container with NodeJS support.
        docker 'infosupport/sonar-scanner:node-10'
    }
    options {
        // Do not perform a Git clone. All files needed are in the stash.
        skipDefaultCheckout()
    }
    steps {
        // Unstash all files needed for the sonarqube Analysis
        unstash 'SonarQubeResultFiles'
        withSonarQubeEnv("sonar") {
            sh "sonar-scanner"
        }
        timeout(time: 30, unit: "MINUTES") {
            waitForQualityGate abortPipeline: true
        }
    }
}
```

### Something else?

There are always other cases which demand other software being present in the Docker container. We will add more when needed. If you run into some common case not supported, let us know!
