kubectl apply -f K8S/backend_deployment.yaml
kubectl apply -f K8S/proxy_deployment.yaml
kubectl apply -f K8S/database_deployment.yaml
kubectl apply -f K8S/backend_service.yaml
kubectl apply -f K8S/proxy_nodeport.yaml
kubectl apply -f K8S/db_service.yaml
kubectl apply -f K8S/db-data-pv.yaml
kubectl apply -f K8S/db-data-pvc.yaml
kubectl apply -f K8S/db-secret.yaml