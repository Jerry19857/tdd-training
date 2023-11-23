pipeline {
   agent any
   environment {
        REPORT_FILES = "report.html"
        REPORT_TITLES = "Shard 1"
        TEST_CASE1 = "tests/example.spec.ts"
        TEST_CASE2 = "tests/example2.spec.ts"
    }
   stages {
      stage('Many tests') {
                  parallel {
                      stage('Shard #1') {
                          agent {
                              docker {
                                  image 'mcr.microsoft.com/playwright:v1.39.0-jammy'
                              }
                          }
                          steps {
                              sh 'npx playwright test --shard=1/2 ${env.TEST_CASE1}'
                          }
                      }
                      stage('Shard #2') {
                          agent {
                              docker {
                                  image 'mcr.microsoft.com/playwright:v1.39.0-jammy'
                              }
                          }
                          steps {
                              sh 'npx playwright test --shard=2/2 ${env.TEST_CASE2}'
                          }
                      }
                  }
              }
      stage('Make report') {
            steps {
                publishHTML([
                            allowMissing: false,
                            alwaysLinkToLastBuild: true,
                            keepAll: true,
                            reportDir: 'test-results',
                            reportFiles: REPORT_FILES,
                            reportName: "aggregated",
                            reportTitles: REPORT_TITLES
                        ])
            }
        }
   }
}