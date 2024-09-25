kubectl delete deployments -n webapp --all
kubectl delete pvc -n webapp --all
kubectl delete pv db-pv
kubectl delete services --all -n webapp
kubectl delete secrets --all -n webapp