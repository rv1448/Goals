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

# resource "aws_eip" "elastic_ip"{
#     vpc = true
#     associate_with_private_ip = var.eip

#     tags = {
#         Name="Production-EIP"
#     }
# }


# resource "aws_nat_gateway" "nat_gateway" {
#     allocation_id = aws_eip.elastic_ip.id
#     subnet_id = aws_subnet.pbsn_1.id

#     tags ={
#         Name="Production-EIP"
#     }
# }

# resource "aws_route" "nat_gateway_router"{
#     route_table_id = aws_route_table.public_route_table.id
#     nat_gateway_id = aws_nat_gateway.nat_gateway.id
#     destination_cidr_block ="0.0.0.0/0"
# }

#[id=sg-070b7e20d203e0237]


resource  "aws_internet_gateway" "internet_gateway" {
    vpc_id = aws_vpc.vpc_design.id
    tags = {
        Name="production-IGW"
    }
}


resource "aws_route" "igw_route" {
    route_table_id = aws_route_table.public_route_table.id
    gateway_id = aws_internet_gateway.internet_gateway.id
    destination_cidr_block ="0.0.0.0/0"
}

resource "aws_instance" "my-first-ec2-terraform" {
    ami = "ami-03657b56516ab7912"
    instance_type = "t2.micro"
    key_name = "first-ec2-key"
    security_groups =["sg-070b7e20d203e0237"]
    #[aws_security_group.ec2-security-group.name]

}


resource "aws_security_group" "ec2-security-group" {
  name="EC2-security-group"
  vpc_id = aws_vpc.vpc_design.id
  ingress {
      from_port=0
      protocol="-1"
      to_port=0
      cidr_blocks=["0.0.0.0/0"]

  }
  egress {
      from_port=0
      protocol="-1"
      to_port=0
      cidr_blocks=["0.0.0.0/0"]

  }
}