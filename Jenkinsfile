pipeline {
    agent any
    stages {
        stage('build playwright'){
            steps {
                echo 'build playwright'
                sh 'docker build --rm -t playwright .'
            }
        }

        stage('Run playwright'){
            steps {
                echo 'Run playwright'
                   script {
                       // Start your Docker container in detached mode (-d)
                       def containerId = sh(script: 'docker run -d playwright-test', returnStdout: true).trim()

                       // Execute Playwright commands inside the running container
                       sh "docker exec playwright-test npx playwright test"
                   }
            }
        }
    }
}
