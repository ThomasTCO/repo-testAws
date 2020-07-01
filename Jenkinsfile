@Library('pipeline-library-demo@master')_

pipeline {

   agent {
        docker { 
            image 'node:latest'
            label 'demolinuxagent'
            args '-u root'
        }
    }

   stages {
         stage('Deploy lambdas') {
             steps {
                 withAWS(credentials:'jenkins') {
                     sh '''
                        npm install -g serverless
                        git clone https://github.com/ThomasTCO/repo-testAws.git test_tco
                        cd test_tco
                        sh 'src/scripts/deploy.sh'
                     '''
                 }
                echo 'Building...'
                sleep(5)
             }
         }
    }
    post {
        always { 
            script {
                sh '''
                    rm -r test_tco
                '''
            }

            test 'Serverless'

            script {
                if(currentBuild.result == 'SUCCESS') {
                    notifications 'Lambdas well deployed on AWS'
                }
                else {
                    notifications 'Problem when deploying Lambdas on AWS'
                }
            }

            // Archive the built artifacts
            sh 'echo "Test archive" > text.txt'
            archiveArtifacts artifacts: 'text.txt'
        }
    }
}