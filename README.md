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
https://github.com/user-attachments/assets/afa9a5ae-1f78-41a6-82a3-d3060de6df63


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
![image](https://github.com/user-attachments/assets/7b57c610-c2a9-463a-bbc2-eefedfeb3a18)

# Image On Docker Hub 
Example Screenshot of the Image on Docker Hub:
![image](https://github.com/user-attachments/assets/d297376e-3b12-44bd-ab91-8f93a36cdc7c)

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
![image](https://github.com/user-attachments/assets/fd2905e0-4d7e-4443-890b-be5afe6426e1)

4. Install the Email Extension Plugin
    1. Go to Manage Jenkins > Manage Plugins.
    2. In the Available tab, search for Email Extension Plugin.
    3. Install the plugin and restart Jenkins if prompted.
5. Configure Email Notifications in Your Pipeline
    Add the emailext step in your Jenkinsfile to send email notifications like this :

# Conclusion
By following the steps outlined in this README, you will be able to automate the deployment of your Python application using Jenkins, Docker, Vagrant, and Ansible. This setup ensures a streamlined and efficient deployment process, reducing manual intervention and increasing reliability.
ith this CI/CD pipeline:
- Code updates are automatically tested, built, and deployed.
- Docker containers ensure consistency across environments.
- Ansible automates infrastructure provisioning and configuration.
- Vagrant provides a flexible and reproducible virtualized environment.
  
This approach enhances scalability, maintainability, and efficiency, making it easier to manage deployments in real-world scenarios.
