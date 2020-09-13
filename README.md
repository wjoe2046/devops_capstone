# Udacity Cloud DevOps Capstone Project: Node Web App

This project deploys a simple Node.js + Express application on an AWS Kubernetes cluster, via an integrated CICD pipeline managed by a Jenkins server.

You may acccess the live project here:

http://ec2-34-222-35-64.us-west-2.compute.amazonaws.com:8080/

## Project Files

- **Application files**

  - **server.js** - This is the Node.JS application
  - **index.html** - This is the default index.html file
  - **.gitignore** - This has the files that should not be added to the git repository

- **Docker files**
  - **Dockerfile** - This is the docker build file to containerize the application inside Docker
  - **.dockerignore** - This has the files that should not be copied when building the Docker image
- **Script files**
  - **changeTag.sh** - This script will automatically tag dockerfile as new version is being added to the pipeline
  - **kops-create-cluster.sh** - This script will automatically generate kubernetes cluster on AWS k8s server using kops. It will create an entire VPC network.
