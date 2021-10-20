provider "aws" {
  region = "us-east-1"
}

variable vpc_cidr_block{}
variable subnet_cidr_block{}
variable env_prefix {}
variable avail_zone{}

resource "aws_vpc" "automatedproject" {
  cidr_block = var.vpc_cidr_block
  tag = {
      Name = "$(var.env_prefix)-vpc"
  }
}

resource "aws_subnet" "automatedproject" {
    vpc_id = aws_vpc.automatedproject.id
    cidr_block = var.subnet_cidr_block
    availability_zone = var.avail_zone
    tag = {
          Name = "$(var.env_prefix)-subnet"
    } 
}

