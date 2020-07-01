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
             environment {
                NUM_GIT_COMMIT = sh(returnStdout: true, script: "git log -n 1 --pretty=format:'%h'").trim()
             }
             steps {
                 withAWS(credentials:'jenkins') {
                     sh '''
                        npm install -g serverless
                        sh 'src/scripts/deploy.sh'
                     '''
                 }
                echo 'Building...'
                sleep(5)

                script {
                    currentBuild.displayName = "commit : " + $NUM_GIT_COMMIT
                }
             }
         }
    }
    post {
        always { 

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