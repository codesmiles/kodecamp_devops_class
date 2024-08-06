# Promomtional task 7

## Docker commands

- Docker image name -> promotional_task_7:v1
- docker build command -> docker build -t promotional_task_7:v1 .
- docker run command -> docker run promotional_task_7:v1
- login to docker via terminal -> docker login
- Tag docker image -> docker tag promotional_task_7:v1 codesmiles/promotional_task_7:v1
- Push docker container to dockerhub -> docker push codesmiles/promotional_task_7:v1
- the repository on dockerhub -> <https://hub.docker.com/r/codesmiles/promotional_task_7/tags>

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

## Tasks

- Create a simple web application:
  - Use Python Programming Language to create your simple application
  Link to the file ![Click here](/tasks/promotional-task-7/app/function.py)
  - The application should display a simple message like "Hello, Welcome to KodeCamp DevOps Bookcamp!"
    ![Python script](/tasks/promotional-task-7/assets/run-python-file.png)
  - You can give your app more features if you choose to.
- Dockerize the application:
  - Write a Dockerfile to containerize the application.
  ![Link to the File](/tasks/promotional-task-7/Dockerfile)
  - Build the Docker image and run it locally to ensure it works correctly.
  ![docker build](/tasks/promotional-task-7/assets/Screenshot%202024-08-05%20at%2016.19.42.png)
  - Tag it and Push the Docker image to a container registry (e.g., Docker Hub).
  ![Push image to container registry](/tasks/promotional-task-7/assets/Screenshot%202024-08-05%20at%2016.24.15.png)
- Deploy the application to a Kubernetes cluster:
  - Create a Kubernetes manifest file for a Deployment to deploy the Docker image.
  ![kubernetes manifest](/tasks/promotional-task-7/kube/kube-deployment.yaml)
  - Deploy the app to your minikube cluster
  ![](/tasks/promotional-task-7/assets/create-namespace.png)![](/tasks/promotional-task-7/assets/start-kubernetes-node.png)![](/tasks/promotional-task-7/assets/create-pod.png)
  - Create a Kubernetes Service of type ClusterIP to expose the application.
  ![Click here to access the file](/tasks/promotional-task-7/kube/kube-service.yaml)
- Test the deployment:
  - Port-forward your service to a localhost port and access it through your web browser.
  - Verify that the application displays the expected message.

## Challenges

1. Unable to port forward my service app to a localhost port and access it in my browser
