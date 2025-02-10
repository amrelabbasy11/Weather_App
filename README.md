# Python Application Deployment with Jenkins, Docker, Vagrant, and Ansible

# Objective
This repository contains all the necessary files and configurations to automate the deployment of a Weather Monitoring System using Jenkins, Docker, Vagrant, and Ansible. The goal is to establish a robust and scalable pipeline for building, deploying, and managing the application efficiently.

# Repository Structure 
Weather_App/
├── Dockerfile                  # Defines the Docker image for the Weather Application
├── app/                        # Contains the source code of the Weather Application
│   ├── app.py                  # Main application file
│   ├── requirements.txt        # Python dependencies
│   ├── static/                 # Static files (CSS, JS, etc.)
│   └── templates/              # HTML templates
├── playbook.yml                # Ansible playbook for managing the deployment on Vagrant machines
├── inventory                   # Ansible inventory file specifying the target Vagrant machines
├── keys/                       # Folder containing private keys for Vagrant machines
│   ├── vm1_private_key         # Private key for Vagrant VM 1
│   └── vm2_private_key         # Private key for Vagrant VM 2
├── Jenkinsfile                 # Defines the CI/CD pipeline for Jenkins
└── README.md                   # Documentation for the repository
