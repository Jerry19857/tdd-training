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
                    withTie() {
                        sh 'script -q /dev/null docker run -it playwright-test'
                    }
                }
            }
        }
    }
}
