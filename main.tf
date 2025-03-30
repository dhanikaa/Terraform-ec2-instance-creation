provider "aws" {
    alias  = "eu-north-1"
    region = "eu-north-1"  # Set your desired AWS region
}

variable "instance_type" {
    description = "EC2 instance type"
    type    = string
    default = "t3.micro"  # Set the desired instance type
}

variable "ami_id" {
    description = "EC2 ami id"
    type = string
}
resource "aws_instance" "example_instance" {
    ami           = var.ami_id  # Specify an appropriate AMI ID
    instance_type = var.instance_type
    provider      = aws.eu-north-1

    # Adding tags, including a Name tag for the instance
    tags = {
        Name = "Terraform-instance"  # Instance name
    }
}

output "public_ip" {
    description = "Public IP address of the EC2 instance"
    value = aws_instance.example_instance.public_ip
}