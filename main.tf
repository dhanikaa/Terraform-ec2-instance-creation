provider "aws" {
    alias  = "eu-north-1"
    region = "eu-north-1"  # Set your desired AWS region
}

resource "aws_instance" "example" {
    ami           = "ami-097c5c21a18dc59ea"  # Specify an appropriate AMI ID
    instance_type = "t3.micro"
    provider      = aws.eu-north-1

    # Adding tags, including a Name tag for the instance
    tags = {
        Name = "Terraform-instance"  # Instance name
    }
}