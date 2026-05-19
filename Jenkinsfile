pipeline {
    agent any

    options {
        timestamps()
        buildDiscarder(logRotator(numToKeepStr: '20'))
    }

    stages {
        stage('Validate') {
            steps {
                sh '''
                    set -eu
                    test -f README.md
                    test -x scripts/smoke-test.sh
                    sh -n scripts/smoke-test.sh
                    mkdir -p build/logs
                '''
            }
        }

        stage('Test') {
            steps {
                sh '''
                    set -eu
                    scripts/smoke-test.sh > build/logs/smoke-test.log
                    cat build/logs/smoke-test.log
                '''
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'build/logs/**/*.log', allowEmptyArchive: true
        }
    }
}
