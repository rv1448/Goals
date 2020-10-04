provider "aws"{
    region = "us-east-2"
    version = "~> 3.7.0"
}

data "aws_caller_identity" "aws_account"{}

resource "aws_s3_bucket" "s3_test" {
   
    bucket = "rv1448-s3-lifecycle-${data.aws_caller_identity.aws_account.account_id}"   
    tags = {
     type="LOG"
     Tier="STANDARD"
    }

    acl = "public-read"

    ## Will preserve the versions
    versioning {
        enabled = true
    }

    lifecycle_rule {
        prefix = "files/"
        enabled = true
    
    transition{
        days = 30 
        storage_class = "STANDARD_IA"
    }


    transition{
        days = 60
        storage_class = "GLACIER"
    }

    expiration {
        days = 90
    }

    }
 
 
}


resource "aws_s3_bucket_policy" "my_bucket_policy" {
  bucket = aws_s3_bucket.s3_test.id
  policy = <<POLICY
{
        "Version": "2012-10-17",
        "Id": "MybucketPolicy",
        "Statement": [
            {
                "Sid": "IPAllow",
                "Effect": "Deny",
                "Principal": "*",
                "Action": "s3:*",
                "Resource": "arn:aws:s3:::${aws_s3_bucket.s3_test.bucket}/*"
            }
        ]
}
POLICY
}

resource "aws_s3_bucket_object" "readme-file" {
    bucket = aws_s3_bucket.s3_test.bucket
    key = "files/readme.md"
    source = "../README.md"
    etag = filemd5("../README.md")
}