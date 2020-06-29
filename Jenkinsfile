pipeline {
   agent {
        docker { 
            image 'node:latest'
            label 'demolinuxagent'
            args '-u root'
        }
    }
   stages {
         stage('Build') {
             steps {
                 script {
                     sh '''
                        npm install --global npm@6 serverless@12
                     '''
                 }
                echo 'Building...'
                sleep(5)
             }
         }
         stage('Stage release') {
             steps {
                echo 'Deploy...'
                sleep(5)
                script {
                  sh '''
                    sh 'src/demo-lambda/python/scripts/deploy.sh'
                  '''
                }
             }
         }
         stage('Deploy') {
             steps {
                echo 'Deployment to dev...'
                sleep(5)
             }
         }
    }
}