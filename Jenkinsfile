pipeline {
    agent any
  stages {
    stage('Checkout Source') {
      steps {
        git branch: 'main', url: 'https://github.com/halimo22/Jenkins_project'
      }
    }
        stage('Push backend') {
            steps {
                build job: 'backend-publish'
            }
        }
        stage('Push proxy') {
            steps {
                build job: 'proxy-publish'
            }
        }

    stage('Deploying to Kubernetes') {
      steps {
        script {
          sh './run-script.sh'
        }
      }
    }
  }
}
