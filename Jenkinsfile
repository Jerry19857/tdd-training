pipeline {
   agent { docker { image 'mcr.microsoft.com/playwright:v1.39.0-jammy' } }
   stages {
      stage('e2e-tests') {
         steps {
            sh 'npm ci'
            sh 'npx playwright test'
         }
      }
      stage('Make report') {
            steps {
                publishHTML([
                            allowMissing: false,
                            alwaysLinkToLastBuild: true,
                            keepAll: true,
                            reportDir: 'playwright-report',
                            reportFiles: 'index1.html',
                            reportName: "aggregated",
                            reportTitles: 'shard 1'
                        ])
            }
        }
   }
}