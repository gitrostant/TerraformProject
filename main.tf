provider "aws" {
  region     = "us-east-2"
}

variable "cidr_block" {
  description = "cidr block for vpc and subnets"
  type = list(string)
}

variable "environment" {
  description = "deployment environment"
}

resource "aws_vpc" "development_vpc" {
  cidr_block = var.cidr_block[0]
  tags = {
    Name: var.environment
  }
}

resource "aws_subnet" "dev-subnet-1" {
  vpc_id = aws_vpc.development_vpc.id
  cidr_block = var.cidr_block[1]
  availability_zone = "us-east-2a"
   tags = {
    Name: "subnet-1-dev"
  }
}


