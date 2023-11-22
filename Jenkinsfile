pipeline {
    agent any
    stages {
        stage('build playwright'){
            steps {
                echo 'build playwright'
                sh 'docker build --rm -t playwright .'
            }
        }

        stage('Run playwright test case #1'){
            steps {
                echo 'Run playwright test case #1'
                   script {
                       sh "docker run playwright npx playwright test --filter example.spec.ts:2"
                   }
            }
        }
        stage('Run playwright test case #2'){
                    steps {
                        echo 'Run playwright test case #2'
                           script {
                               sh "docker run playwright npx playwright test --filter example.spec.ts:2"
                           }
                    }
                }
    }
}
