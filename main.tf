variable "AWS_ACCESS_KEY_ID" {
  description = "AWS Access Key ID"
  type        = string

}

variable "AWS_SECRET_ACCESS_KEY" {
    description = "AWS Secret Access Key"
  type        = string

}


terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region     = "af-south-1"
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
}

resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}