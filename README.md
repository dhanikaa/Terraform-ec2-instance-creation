# Terraform AWS EC2 Instance Deployment

## Introduction to Terraform
Terraform is an open-source Infrastructure as Code (IaC) tool that allows you to define and provision cloud infrastructure using a declarative configuration language. It enables consistent and automated deployment of resources across multiple cloud providers, including AWS, Azure, and Google Cloud.

### Why Use Terraform?
- **Infrastructure as Code**: Automate infrastructure management with code.
- **Multi-Cloud Support**: Deploy resources on AWS, Azure, Google Cloud, and more.
- **State Management**: Keeps track of the infrastructure changes.
- **Modularity**: Reusable configurations using modules.

## Prerequisites
Before getting started, ensure you have the following installed:
- **Terraform**: Download and install it from [Terraform's official website](https://developer.hashicorp.com/terraform/downloads).
- **AWS CLI**: Install and configure it with your credentials using `aws configure`.
- **AWS Account**: Required to create and manage cloud resources.

## Installation Guide
### Installing Terraform
1. Download Terraform from [Terraform's official page](https://developer.hashicorp.com/terraform/downloads).
2. Extract the binary and add it to your system's PATH.
3. Verify the installation:
   ```sh
   terraform --version
   ```

## Setting Up the Project
Create a directory for your Terraform project and navigate to it:
```sh
mkdir terraform-aws-instance
cd terraform-aws-instance
```

Create a Terraform configuration file named `main.tf` and define the AWS provider and an EC2 instance resource.

## Terraform Configuration: `main.tf`
```hcl
provider "aws" {
    alias  = "eu-north-1"
    region = "eu-north-1"  # AWS region
}

variable "instance_type" {
    description = "EC2 instance type"
    type        = string
    default     = "t3.micro"
}

variable "ami_id" {
    description = "EC2 AMI ID"
    type        = string
}

resource "aws_instance" "example_instance" {
    ami           = var.ami_id
    instance_type = var.instance_type
    provider      = aws.eu-north-1

    tags = {
        Name = "Terraform-instance"
    }
}

output "public_ip" {
    description = "Public IP address of the EC2 instance"
    value       = aws_instance.example_instance.public_ip
}
```

## Initializing Terraform
Navigate to your project directory and initialize Terraform:
```sh
terraform init
```
This downloads the required provider plugins and prepares your working directory.

## Applying the Configuration
To deploy your infrastructure, run:
```sh
terraform apply
```
Terraform will show a plan of the changes it's about to make. Type `yes` when prompted to apply them.

## Verifying Resources
After the deployment is complete, you can check the created instance:
```sh
echo "Instance Public IP: $(terraform output public_ip)"
```
You can also verify it via the AWS Management Console.

## Destroying Resources
To remove all the created resources, execute:
```sh
terraform destroy
```
This command ensures that all the infrastructure defined in your `main.tf` file is removed.

## Conclusion
This repository serves as a simple example of using Terraform to provision an AWS EC2 instance. You can extend this configuration by adding security groups, key pairs, and other AWS services as needed.

Happy Coding! 🚀