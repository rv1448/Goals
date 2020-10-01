provider "aws" {
    region = "us-east-2"
}

resource "aws_s3_bucket" "b"{
    bucket = "test-rv1448-bucket-test"
    tags = {
        name = "week1"
    }
}

resource "aws_s3_bucket" "tf-remote-state" {
  bucket = "terraform-remotestate-rv1448"
}

module "module_vpc" {
    source = "./modules/vpc_connectivity"
    aws_vpc_cidr = var.aws_vpc_cidr
    aws_private_subnet1 = var.aws_private_subnet1
    aws_public_subnet2 = var.aws_public_subnet2
    aws_private_subnet3 = var.aws_private_subnet3 
    aws_public_subnet4 = var.aws_public_subnet4 
    }


    ##modules/vpc_connectivity