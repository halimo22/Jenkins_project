# Jenkins Project
```sh
 helm repo add jenkins https://charts.jenkins.io
 helm repo update
 helm install jenkins jenkins/jenkins --set adminPassword=<your_password>
```
- Access jenkins through minikube service
```sh
minikube service --all
```
Multibranch  project 
source code : git 
add your own project , must have Jenkinsfile with the config

[My Jenkinsfile](Jenkinsfile)

apply all role/rolebinnding/clusterrole/clusterrolebinding


