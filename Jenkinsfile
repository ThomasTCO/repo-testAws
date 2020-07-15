pipeline {

    agent {
        docker { 
            image '000134115625.dkr.ecr.eu-west-3.amazonaws.com/serverless-docker:1.0.0'
            label 'ec2-linux'
            args '-u root'
        }
    }

   stages {
         stage('Deploy lambdas on dev teet') {
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