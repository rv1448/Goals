variable "aws_region" {
    default = "us-east-2"
}

variable "prod_vpc" {
    default = "10.0.0.0/16"
}

variable "public_subnet_1" {
    default = "10.0.0.0/19"
}
variable "public_subnet_2" {
    default = "10.0.32.0/19"
}
variable "public_subnet_3" {
    default = "10.0.64.0/19"
}
variable "private_subnet_1" {
    default = "10.0.96.0/19"
}
variable "private_subnet_2" {
    default ="10.0.128.0/19"
}
variable "private_subnet_3" {
    default ="10.0.160.0/19"
}

variable "eip" {
    default="10.0.64.0/19"  
}


# 10      .0       .0       .0  
# 11111111.11111111.11111111.11111111
# 255     .255     .255     .255

# 128
# 64
# 32
# 16
# 8
# 4
# 2
# 1

# 32,64,96,128