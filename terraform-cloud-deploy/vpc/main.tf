provider "aws"{
    region = var.aws_region
}

resource "aws_vpc" "vpc_design"{

    cidr_block = var.prod_vpc
    enable_dns_hostnames = true

    tags {
        Name="Productionvpc"
    }
}

resource "aws_subnet" "pbsn_1"{
    cidr_block = var.public_subnet_1
    vpc_id = aws_vpc.vpc_design.id
    availability_zone = "{var.aws_region}a"
    tags {
        Name="Public-subnet-1"
    }
}

resource "aws_subnet" "pbsn_2"{
    cidr_block = var.public_subnet_2
    vpc_id = aws_vpc.vpc_design.id
    availability_zone = "{var.aws_region}b"
    tags {
        Name="Public-subnet-2"
    }
}

resource "aws_subnet" "pbsn_3"{
    cidr_block = var.public_subnet_3
    vpc_id = aws_vpc.vpc_design.id
    availability_zone = "{var.aws_region}c"
    tags {
        Name="Public-subnet-3"
    }
}
 

resource "aws_subnet" "pvsn_1"{
    cidr_block = var.private_subnet_1
    vpc_id = aws_vpc.vpc_design.id
    availability_zone = "{var.aws_region}a"
    tags {
        Name="Private-subnet-1"
    }
}

resource "aws_subnet" "pvsn_2"{
    cidr_block = var.private_subnet_2
    vpc_id = aws_vpc.vpc_design.id
    availability_zone = "{var.aws_region}b"
    tags {
        Name="Private-subnet-2"
    }
}

esource "aws_subnet" "pvsn_3"{
    cidr_block = var.private_subnet_3
    vpc_id = aws_vpc.vpc_design.id
    availability_zone = "{var.aws_region}c"
    tags {
        Name="Private-subnet-3"
    }
}