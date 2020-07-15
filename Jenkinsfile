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
                 withAWS(credentials:'gekko-cicd') {
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
}