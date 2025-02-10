# Python Application Deployment with Jenkins, Docker, Vagrant, and Ansible

# Introduction
This repository contains all the necessary files and configurations to automate the deployment of a Weather Monitoring System using Jenkins, Docker, Vagrant, and Ansible. The goal is to establish a robust and scalable pipeline for building, deploying, and managing the application efficiently.

# Project Directory Layout
- Dockerfile: Defines the Docker image for containerizing the Python application.
- Application Files: Contains the source code, templates, and dependencies.
- Vagrantfile: Configures the virtual machines for deployment.
- deploy.yml: Ansible playbook to automate the deployment process on Vagrant-managed machines.
- inventory: Ansible inventory file listing the target Vagrant hosts.
- keys: Directory storing private keys for secure Jenkins access to the Vagrant machines.
- Jenkinsfile: Defines the CI/CD pipeline steps for Jenkins automation.

# Dependencies 
Ensure the following are installed:
- Docker
- Vagrant
- Ansible
- Jenkins
- A Private GitHub Repository
- Docker Hub

# Setup Guide


https://github.com/user-attachments/assets/2a5e38d7-2709-44eb-9fc0-23b6c408463d


![Add a little bit of body text(1)](https://github.com/user-attachments/assets/92f94b39-3eb2-4b18-9d6b-774c0672214c)

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
![Screenshot From 2025-02-10 20-00-38](https://github.com/user-attachments/assets/8ca6a14e-d28f-4e99-9a9b-badc21dda92c)

# Image On Docker Hub 
Example Screenshot of the Image on Docker Hub:
![image](https://github.com/user-attachments/assets/cc062daa-2945-484d-9f53-69e8c3e755d3)

# Containers Running Successfully
Below is a screenshot showing the containers actively running on both machines:
![image](https://github.com/user-attachments/assets/e75b0c35-07ba-4b8b-bcbd-89f4f0f000bd)

# Application Execution
Once everything is set up, you can launch your application. Below are screenshot showing the application output:
![image](https://github.com/user-attachments/assets/07de0fc7-90e6-41e4-9d20-00db525d4f6d)

# Conclusion
By following the steps outlined in this README, you will be able to automate the deployment of your Python application using Jenkins, Docker, Vagrant, and Ansible. This setup ensures a streamlined and efficient deployment process, reducing manual intervention and increasing reliability.
ith this CI/CD pipeline:
- Code updates are automatically tested, built, and deployed.
- Docker containers ensure consistency across environments.
- Ansible automates infrastructure provisioning and configuration.
- Vagrant provides a flexible and reproducible virtualized environment.
  
This approach enhances scalability, maintainability, and efficiency, making it easier to manage deployments in real-world scenarios.
