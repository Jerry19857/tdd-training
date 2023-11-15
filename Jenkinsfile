pipeline {
    agent any
    stages {
        stage('build playwright'){
            steps {
                echo 'build playwright'
                sh 'docker build --rm -t playwright .'
            }
        }

        stage('NPM Install') {
            steps {
                echo 'npm Install'
                echo '******************************'
            }
        }

        stage('Yarn Build') {
            steps {
                echo 'Yarn Build'
                echo '******************************'
            }
        }
        stage('Deploy') {
            steps{
                echo 'Deploy'
                echo '******************************'
            }
        }
    }
}
