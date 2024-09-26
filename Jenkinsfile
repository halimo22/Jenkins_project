pipeline {
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
          kubernetesDeploy(configs: "K8S/backend_deployment.yaml, K8S/backend_service.yaml, K8S/proxy_deployment.yaml, K8S/proxy_service.yaml, K8S/db_service.yaml, K8S/database_deployment.yaml, K8S/db-data-pv.yaml, K8S/db-data-pvc.yaml, K8S/db-secret.yaml")
        }
      }
    }
  }
}
