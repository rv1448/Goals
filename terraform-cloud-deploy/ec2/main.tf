provider "aws" {
    region="us-east-2"
}


resource "aws_vpc" "default"{
    cidr_block = "10.0.0.0/16"
  
    
}

resource "aws_subnet" "pbsn_1" {
    cidr_block = "10.0.0.0/24"
    vpc_id = aws_vpc.default.id
    map_public_ip_on_launch = true
}


resource "aws_subnet" "pvsn_1" {
    cidr_block = "10.0.128.0/24"
    vpc_id = aws_vpc.default.id
}

resource "aws_instance" "test-ec2" {
    ami = "ami-03657b56516ab7912"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.pbsn_1.id
    key_name = "first-ec2-key"
tags = {
    Name="week2"
    Terraform   = "true"
    Environment = "dev"
  }
}

