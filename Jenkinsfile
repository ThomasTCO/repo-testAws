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
         stage('Deploy lambdas on dev') {
             when {
                branch 'dev'
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
             }
         }
         stage('Deploy lambdas on prod') {
             when {
                branch 'master'
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
            script {
                NUM_GIT_COMMIT = sh(returnStdout: true, script: "git log -n 1 --pretty=format:'%h'").trim()
                sh "echo 'Num commit: $NUM_GIT_COMMIT' > num_commit.txt"
                archiveArtifacts artifacts: 'num_commit.txt'
            }
        }
    }
}