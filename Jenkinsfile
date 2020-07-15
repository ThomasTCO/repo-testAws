pipeline {

    agent {
        docker { 
            image '000134115625.dkr.ecr.eu-west-3.amazonaws.com/serverless-docker:1.0.0'
            label 'ec2-linux'
            args '-u root'
        }
    }

   stages {
        stage('Test whatever the branch') {
             steps {
                echo 'Testting...'
                sleep(10)
             }
         }
         stage('Deploy lambdas on dev') {
             when {
                branch 'dev'
             }
             steps {
                 withAWS(credentials:'jenkins') {
                     sh '''
                        npm install -g serverless
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
                 withAWS(credentials:'gekko-cicd') {
                     sh '''
                        npm install -g serverless
                     '''
                 }
                echo 'Building...'
                sleep(5)
             }
         }
    }
}