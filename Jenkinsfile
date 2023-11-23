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
                  steps {
                      script {
                          generateReportFiles()
                          generateReportTitles()
                          doDynamicParallelTestSteps()
                      }
                  }
              }
      stage('Make report') {
            steps {
                script {
                    doUnstashShards()
                }
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

def generateReportFiles() {
    int totalShards = Integer.parseInt(params.SHARDS)
    for (i = 1; i < totalShards; i++) {
        int shardNum = i + 1
        REPORT_FILES = REPORT_FILES + ', report' + shardNum + '.html'
    }
}
def generateReportTitles() {
    int totalShards = Integer.parseInt(params.SHARDS)
    for (i = 1; i < totalShards; i++) {
        int shardNum = i + 1
        REPORT_TITLES = REPORT_TITLES + ', Shard ' + shardNum
    }
}
def doDynamicParallelTestSteps() {
    tests = [:]
    int totalShards = Integer.parseInt(params.SHARDS)
    for (i = 0; i < totalShards; i++) {
        def shardNum = "${i+1}"
        tests["${shardNum}"] = {
            node('qa-executors') {
                stage("Shard #${shardNum}") {
                    docker.image('mcr.microsoft.com/playwright:v1.39.0-jammy').inside {
                        catchError() {
                            sh "npx playwright test --shard=${shardNum}/${totalShards}"
                        }
                        sh "mv playwright-report/report.html playwright-report/index${shardNum}.html"
                        stash includes: "playwright-report/report${shardNum}.html", name: "shard${shardNum}"
                    }
                }
            }
        }
    }
    parallel tests
}
def doUnstashShards() {
    int totalShards = Integer.parseInt(params.SHARDS)
    for (i = 0; i < totalShards; i++) {
        unstash "shard${i+1}"
    }
}