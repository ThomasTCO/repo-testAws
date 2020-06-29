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
                 script {
                     withAWS(credentials:'jenkins') {
                         sh '''
                            npm install -g serverless
                            git clone https://github.com/ThomasTCO/repo-testAws.git test_tco
                            cd test_tco
                            sh 'src/scripts/deploy.sh'
                         '''
                     }
                 }
                echo 'Building...'
                sleep(5)
             }
         }
    }
    post {
        always { 
            script {
                sh 'rm -r test_tco'
            }
        }
    }
}