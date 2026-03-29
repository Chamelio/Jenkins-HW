Jenkins Armageddon Validation Lab
Class 7 DevOps & Jenkins Validation Submission
📌 Project Overview
This repository contains the automation and infrastructure-as-code (IaC) files required for the Class 7 Armageddon validation. The project demonstrates a fully automated CI/CD pipeline that provisions AWS infrastructure and deploys lab evidence.
Validation Criteria Met:
Infrastructure Provisioning: Automated AWS resource creation (S3, EC2) using Terraform.
CI/CD Pipeline: End-to-end automation via Jenkins for consistent deployments.
Artifact Management: Automated upload of 7 unique lab evidence files to an S3 bucket.
State Management: Integration of Terraform state with remote or local tracking. 
🛠 Tech Stack
Cloud Provider: Amazon Web Services (AWS)
Infrastructure as Code: Terraform
Automation Server: Jenkins
Version Control: GitHub
📂 Repository Structure
text
.
├── main.tf                 # Primary Terraform configuration
├── variables.tf            # Variable definitions
├── Jenkinsfile             # Jenkins Pipeline definition
└── lab-evidence/           # Directory containing validation JPGs
    ├── image1.jpg
    ├── ...
    └── image7.jpg
Use code with caution.

🚀 Getting Started
1. Prerequisites
Jenkins server installed and configured.
Terraform installed on the Jenkins agent.
AWS Credentials configured as Jenkins credentials or environment variables. 
2. Jenkins Pipeline Setup
Create a new Pipeline job in Jenkins.
Under Pipeline, select "Pipeline script from SCM".
Set SCM to Git and use the repository URL: https://github.com/Chamelio/Jenkins-HW.git.
Ensure the branch is set to main and the Script Path is Jenkinsfile.
3. Running the Validation 
Click Build Now in Jenkins. The pipeline will:
Perform a terraform init.
Generate a terraform plan for the 7 S3 objects and required infrastructure.
Apply the configuration to provision resources in your AWS account. 
📊 Evidence & Results
Upon successful completion, the aws_s3_object resource block will have uploaded 7 images to the lab-evidence/ prefix within your target S3 bucket.