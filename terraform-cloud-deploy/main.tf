provider "aws" {
    region = "us-east-2"
}

resource "aws_s3_bucket" "b"{
    bucket = "test-rv1448-bucket-test"
    tags = {
        name = "week1"
    }
}
