# sonar-scanner

Sonar Scanner specifically built for Jenkins Pipelines with Docker steps.

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
