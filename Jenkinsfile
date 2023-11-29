pipeline {
   agent { docker { image 'mcr.microsoft.com/playwright:v1.39.0-jammy' } }
   environment {
        REPORT_FILES = "report.html"
        REPORT_TITLES = "Shard 1"
    }
   stages {
      stage('e2e-tests') {
         steps {
            sh 'npm ci'
            sh 'npx playwright test'
            sh 'ls'
         }
      }
      stage('Make report') {
            steps {
                publishHTML([
                            allowMissing: false,
                            alwaysLinkToLastBuild: true,
                            keepAll: true,
                            reportDir: 'monocart-report',
                            reportFiles: REPORT_FILES,
                            reportName: "aggregated",
                            reportTitles: REPORT_TITLES
                        ])
            }
        }
   }
}