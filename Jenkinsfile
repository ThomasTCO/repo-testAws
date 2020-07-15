pipeline {

    agent {
        docker { 
            image '000134115625.dkr.ecr.eu-west-3.amazonaws.com/serverless-docker:1.0.0'
            label 'ec2-linux'
            args '-u root'
        }
    }

   stages {
         stage('Deploy lambdas') {
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