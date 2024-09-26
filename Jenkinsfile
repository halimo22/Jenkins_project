pipeline {
  environment {
    dockerproxyImage = ""
    proxyimagename = "halimo2/proxy"
    dockerbackendImage = ""
    backendimagename = "halimo2/backend"
    registryCredential = "Docker"
  }
  agent {
    docker {
      image 'docker:19.03.12-dind'
      args '-v /var/run/docker.sock:/var/run/docker.sock'
    }
  }
  stages {
    stage('Checkout Source') {
      steps {
        git branch: 'main', url: 'https://github.com/halimo22/Jenkins_project'
      }
    }

    stage('Build images') {
      steps {
        script {
          dockerproxyImage = docker.build(proxyimagename, "./Dockerfiles/proxy")
          dockerbackendImage = docker.build(backendimagename, "./Dockerfiles/backend")
        }
      }
    }

    stage('Pushing Images to Dockerhub') {
      steps {
        script {
          docker.withRegistry('https://registry.hub.docker.com', registryCredential) {
            dockerproxyImage.push("latest")
            dockerbackendImage.push("latest")
          }
        }
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
