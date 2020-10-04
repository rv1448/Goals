provider "aws"{
    region = var.aws_region
}

resource "aws_vpc" "vpc_design"{

    cidr_block = var.prod_vpc
    enable_dns_hostnames = true

    tags = {
        Name="Productionvpc"
    }
}

resource "aws_subnet" "pbsn_1"{
    cidr_block = var.public_subnet_1
    vpc_id = aws_vpc.vpc_design.id
    availability_zone = "${var.aws_region}a"
    tags = {
        Name="Public-subnet-1"
    }
}

resource "aws_subnet" "pbsn_2"{
    cidr_block = var.public_subnet_2
    vpc_id = aws_vpc.vpc_design.id
    availability_zone = "${var.aws_region}b"
    tags = {
        Name="Public-subnet-2"
    }
}

resource "aws_subnet" "pbsn_3"{
    cidr_block = var.public_subnet_3
    vpc_id = aws_vpc.vpc_design.id
    availability_zone = "${var.aws_region}c"
    tags = {
        Name="Public-subnet-3"
    }
}
 

resource "aws_subnet" "pvsn_1"{
    cidr_block = var.private_subnet_1
    vpc_id = aws_vpc.vpc_design.id
    availability_zone = "${var.aws_region}a"
    tags = {
        Name="Private-subnet-1"
    }
}

resource "aws_subnet" "pvsn_2"{
    cidr_block = var.private_subnet_2
    vpc_id = aws_vpc.vpc_design.id
    availability_zone = "${var.aws_region}b"
    tags = {
        Name="Private-subnet-2"
    }
}

resource "aws_subnet" "pvsn_3"{
    cidr_block = var.private_subnet_3
    vpc_id = aws_vpc.vpc_design.id
    availability_zone = "${var.aws_region}c"
    tags = {
        Name="Private-subnet-3"
    }
}


resource "aws_route_table" "public_route_table" {
    vpc_id = aws_vpc.vpc_design.id
    tags = {
        Names="public-route-table"
    }
}

resource "aws_route_table" "private_route_table" {
    vpc_id = aws_vpc.vpc_design.id
    tags = {
        Names="private-route-table"
    }
}

resource "aws_route_table_association" "public_subnet_1_association"{
    route_table_id = aws_route_table.public_route_table.id
    subnet_id = aws_subnet.pbsn_1.id
}

resource "aws_route_table_association" "public_subnet_2_association"{
    route_table_id = aws_route_table.public_route_table.id
    subnet_id = aws_subnet.pbsn_2.id
}

resource "aws_route_table_association" "public_subnet_3_association"{
    route_table_id = aws_route_table.public_route_table.id
    subnet_id = aws_subnet.pbsn_3.id
}





resource "aws_route_table_association" "private_subnet_1_association"{
    route_table_id = aws_route_table.private_route_table.id
    subnet_id = aws_subnet.pvsn_1.id
}

resource "aws_route_table_association" "private_subnet_2_association"{
    route_table_id = aws_route_table.private_route_table.id
    subnet_id = aws_subnet.pvsn_2.id
}

resource "aws_route_table_association" "private_subnet_3_association"{
    route_table_id = aws_route_table.private_route_table.id
    subnet_id = aws_subnet.pvsn_3.id
}