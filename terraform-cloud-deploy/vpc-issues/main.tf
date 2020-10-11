provider "aws"{
region = "us-east-2"
}


resource "aws_s3_bucket" "bucket1"{
	bucket = "rv-1448-bucket1-test2"

}


resource "aws_vpc" "test_vpc" {
  cidr_block = "10.1.0.0/16"
  tags= {
	  name="week2"
  }
}

resource "aws_subnet" "pbsn1" {
	cidr_block = "10.1.0.0/17"
	vpc_id = aws_vpc.test_vpc.id
	enable_dns_hostnames = true
  
}

resource "aws_subnet" "pvsn1" {
	cidr_block = "10.1.128.0/17" 
	vpc_id = aws_vpc.test_vpc.id
}