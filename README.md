# Automated Deployment of a Python Application Using Jenkins, Docker, Vagrant, Ansible, and Kubernetes

# Introduction
This repository contains all the necessary files and configurations to automate the deployment of a Weather Monitoring System using Jenkins, Docker, Vagrant, Ansible, and Kubernetes. The goal is to establish a robust, scalable, and efficient pipeline for building, deploying, and managing the application.

# Project Directory Layout
- Dockerfile: Defines the Docker image for containerizing the Python application.
- Application Files: Contains the source code, templates, and dependencies.
- Vagrantfile: Configures the virtual machines for deployment.
- deploy.yml: Ansible playbook to automate the deployment process on Vagrant-managed machines.
- inventory: Ansible inventory file listing the target Vagrant hosts.
- keys: Directory storing private keys for secure Jenkins access to the Vagrant machines.
- Jenkinsfile: Defines the CI/CD pipeline steps for Jenkins automation.
- k8s: Directory containing Kubernetes manifests (YAML files) for deploying and managing the application in a Kubernetes cluster.

# Dependencies 
Ensure the following are installed:
- Docker
- Vagrant
- Ansible
- Kubernetes
- Jenkins
- A Private GitHub Repository
- Docker Hub

# Setup Guide
![WhatsApp Image 2025-02-15 at 21 05 40_d92a06d3](https://github.com/user-attachments/assets/9c7e15dd-0bf8-4742-a6ee-e7e2c9f5ac06)



1. Push Application Code to GitHub
Store the Python application source code in a private GitHub repository.

2. Create a Dockerfile
Write a Dockerfile to package the application into a container and commit it to the repository.

3. Set Up Vagrant Machines
Launch two lightweight virtual machines using Vagrant.

4. Configure Jenkins for Automated Deployment
Jenkins will orchestrate the following steps:
- Clone Repository: Fetch the latest code from GitHub using secure credentials.
- Build Docker Image: Use the Dockerfile to create a containerized version of the application.
- Push Image to Docker Hub: Upload the Docker image to Docker Hub for distribution.
- Run Ansible Playbook: Automate deployment with Ansible, performing:
- Installation of Docker on Vagrant machines.
- Pulling the application image from Docker Hub.
- Running the containerized application on the virtual machines.

5. Deploy to Kubernetes using ArgoCD

# Jenkins Setup
1. Connect Jenkins with GitHub and Docker (Important: Since the repository is private, authentication is required):
   
   - Configure GitHub credentials in Jenkins to allow access to the private repository.
   - Set up Docker credentials in Jenkins to push images to Docker Hub.

3. Create a Pipeline Job:

   - Set up a new Jenkins pipeline to manage the deployment process.

4. Use the Provided Jenkinsfile:

   - Configure the pipeline using the Jenkinsfile script included in this repository.

 # Successful Pipeline Execution
 Example Screenshot of a Successful Run:
![image](https://github.com/user-attachments/assets/7b57c610-c2a9-463a-bbc2-eefedfeb3a18)

# Image On Docker Hub 
Example Screenshot of the Image on Docker Hub:
![image](https://github.com/user-attachments/assets/a1f33ca3-304c-4204-ae75-2fee99bd45ff)

# Containers Running Successfully
Below is a screenshot showing the containers actively running on both machines:
![image](https://github.com/user-attachments/assets/51640309-5c7b-4897-8671-7c6648b8c0df)

# Application Execution
Once everything is set up, you can launch your application. Below are screenshot showing the application output:

- The First vagrant machine : 

![image](https://github.com/user-attachments/assets/de386313-d5dd-4d57-9198-c7e9f0ef141a)

- The Second vagrant machine :

![image](https://github.com/user-attachments/assets/af22eac8-12f8-47f9-857f-3c2551683bbb)

# Email Notification
To set up email notifications in Jenkins, follow these steps:

1. Access Jenkins System Settings
   - Log in to your Jenkins dashboard.
   - Go to Manage Jenkins > System.
2. Configure SMTP Serve
    1. Scroll down to the E-mail Notification section.

    2. Fill in the following details:
        - SMTP Server: smtp.gmail.com
        - User Name: Your Gmail address (e.g., your-email@gmail.com).
        - Password: Your Gmail app password (generate one from your Google Account settings if needed).
        - Use SSL: Enable this option.
        - SMTP Port: Use 465 for SSL or 587 for TLS.
   - Note:
    SSL (Port 465): Encrypts the connection using SSL.
    TLS (Port 587): Encrypts the connection using TLS (preferred for modern setups).
   3. Click Apply and Save.
3. Test Email Configuration
    1. In the E-mail Notification section, click Test configuration by sending a test email.
    2. Enter your email address and click Test configuration.
    3. Ensure you receive a test email to confirm the setup is working.
![WhatsApp Image 2025-02-15 at 06 25 11_490a493a](https://github.com/user-attachments/assets/a3b8320c-8758-4459-b03d-b9e6940760e1)

4. Install the Email Extension Plugin
    1. Go to Manage Jenkins > Manage Plugins.
    2. In the Available tab, search for Email Extension Plugin.
    3. Install the plugin and restart Jenkins if prompted.
5. Configure Email Notifications in Your Pipeline
    Add the emailext step in your Jenkinsfile to send email notifications.
6. Verify Email Notifications
    1. Run your Jenkins pipeline.
    2. Check your email inbox for notifications based on the pipeline's success or failure.
       
- Success:
![WhatsApp Image 2025-02-15 at 06 25 12_43a3e189](https://github.com/user-attachments/assets/43c6c750-5880-4ccb-8c81-6a00258e4cdc)
![WhatsApp Image 2025-02-15 at 06 25 12_b3c570a3](https://github.com/user-attachments/assets/bc5533d2-87b1-49d2-93a5-e21c14d9f195)

- Debug the email notification
 1. Write this command in build docker image stage :  sh 'exit 1' // Force the stage to fail
 2. it should send an email that say the build is failed like this mail :
![image](https://github.com/user-attachments/assets/eccadfed-ca56-4624-9d3f-e43a5f234d16)
![image](https://github.com/user-attachments/assets/6474153d-aff4-4c14-8540-4cdad7f17cb7)


- Note
  If the email is not sent even after following the steps you mentioned, try adding your email as a credential in Jenkins.         Here’s how you can do it : 
   Step 1: Add Your Email as a Credential in Jenkins -> Open Jenkins Dashboard -> Go to Jenkins Home -> Click on Manage Jenkins. 
           Go to Credentials Management
           Click on Manage Credentials -> Select (Global credentials).

    Add a New Credential
        Click on Add Credentials.
        In Kind, select Username and password.
        Username: Enter your email (e.g., amrelabbasy2003@gmail.com).
        Password: Enter your email password (or an App Password if using Gmail).
        ID: Give it an identifier like email-credentials.
        Click OK to save.

# Deploying the Weather App on Kubernetes
- Overview
   We will deploy the Weather App on a local Kubernetes cluster using Minikube for setup and ArgoCD for continuous delivery. A deployment.yaml file will be created and         pushed to a GitHub repository for version control.

- Prerequisites
   Ensure you have the following setup:
   - A Virtual Machine (VM) for Minikube
   - Minikube installed on the VM
   - kubectl installed on the VM
   - ArgoCD installed on Minikube
   - A GitHub repository (e.g., https://github.com/amrelabbasy11/weather-app.git)
   - A Docker Hub account with your Weather App image

# Step 1: Install Minikube and kubectl:
 - install Minikube :
  curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
  sudo install minikube /usr/local/bin/

- Install kubectl :
   curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
   chmod +x kubectl
   sudo mv kubectl /usr/local/bin/

- Start Minikube :
   minikube start
# Step 2: Install ArgoCD on Minikube
# Step 3: Create Kubernetes Deployment and Service
    - Define the Deployment and Service in a deployment.yaml file.
    - Ensure the correct namespace is used.
    - Deploy the resources to Kubernetes.
# Step 4: Push Kubernetes Files to GitHub
# Step 5: Deploy the Weather App to Kubernetes
   - Use ArgoCD to deploy the application.
 ![Screenshot From 2025-02-16 04-44-21](https://github.com/user-attachments/assets/ab70edcc-ddd8-46ef-ab05-c154a476da11)

# Step 6: Configure ArgoCD to Manage the Deployment
   1. Log in to ArgoCD CLI
   2. Register Your GitHub Repository
   3. Create an ArgoCD Application
   4. Sync and Monitor Deployment
   5. Access the Weather App
      
![image](https://github.com/user-attachments/assets/d6dafa92-f575-4231-84c5-a45e388c301c)


# Conclusion
By following the steps outlined in this README, you will be able to automate the deployment of your Python application using Jenkins, Docker, Vagrant, Ansible, and Kubernetes. This setup ensures a streamlined, scalable, and efficient deployment process, reducing manual intervention and increasing reliability.
With this CI/CD pipeline:
- Code updates are automatically tested, built, and deployed.
- Docker containers ensure consistency across environments.
- Ansible automates infrastructure provisioning and configuration.
- Vagrant provides a flexible and reproducible virtualized environment.
- Kubernetes orchestrates containerized applications, ensuring scalability and fault tolerance.
- ArgoCD enables GitOps-style continuous deployment, keeping applications in sync with the repository.

This approach enhances automation, consistency, and scalability, making deployments more efficient and robust. 
