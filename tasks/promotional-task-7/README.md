# Promomtional task 7

## Docker commands

- Docker image name -> promotional_task_7:v1
- docker build command -> docker build -t promotional_task_7:v1 .
- docker run command -> docker run promotional_task_7:v1
- login to docker via terminal -> docker login
- Tag docker image -> docker tag promotional_task_7:v1 codesmiles/promotional_task_7:v1
- Push docker container to dockerhub -> docker push codesmiles/promotional_task_7:v1
- the repository on dockerhub -> https://hub.docker.com/r/codesmiles/promotional_task_7/tags

Kubernetes Commands

- start a minikube cluster-> minikube start nodes 4 -p sandbox
- Get cluster information -> kubectl cluster-info
- fetch the content in a kubernetes cluster -> kubectl config get-contexts | grep "sandbox"
- kubectl get namespaces "<->" kubectl get ns
- kubectl get pods -n sandbox
- kubectl create ns kodecamp
- run nginx server in a po and also creating a pod -> kubectl run my-nginx:latest --image nginx:latest -n kodecamp
- apply the pod to the namespace for kubernetes -> kubectl apply -f kube-deployment.yaml -n kodecamp
- kubectl apply -f kube-deployment.yaml  
