# Verify container in the Pod:  
kubectl get pods  
kubectl logs <pod<pod-name>> #output shows the values of selected environment variables  
kubectl exec -it dapi-envars-fieldref -- sh #get a shell into the Container that is running in your Pod  
/# printenv #view the environment variables in the shell  
  
# Dockerfile / Source code of [images](https://console.cloud.google.com/gcr/images/google-samples/GLOBAL) in gcr.io can be found [here](https://github.com/GoogleCloudPlatform/kubernetes-engine-samples/)  
