
provider "aws" {
    region = "us-east-2"
}

## Creating VPC resource 
## Input CIDR block as variable 
resource "aws_vpc" "main" {
    cidr_block = var.aws_vpc_cidr 
}

## cidr_block, vpc_id, tags
resource "aws_subnet" "subnet1"{
    cidr_block = var.aws_private_subnet1
    vpc_id = aws_vpc.main.id
    tags = {
    Name = "week1"
    }
}

resource "aws_subnet" "subnet2"{
    cidr_block = var.aws_public_subnet2
    vpc_id = aws_vpc.main.id
    tags = {
    Name = "week1"
    }
}


resource "aws_subnet" "subnet3"{
    cidr_block = var.aws_private_subnet3
    vpc_id = aws_vpc.main.id
    tags = {
    Name = "week1"
    }
}

resource "aws_subnet" "subnet4"{
    cidr_block = var.aws_public_subnet4
    vpc_id = aws_vpc.main.id
    tags = {
    Name = "week1"
    }
}
