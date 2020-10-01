output "vpc_id" {
    value = aws_vpc.main.id
}

output "vpc_cidr" {
    value = aws_vpc.main.cidr_block
}


output "subnet_cidr" {
    value = aws_subnet.subnet1.cidr_block
}

output "subnet_cidr" {
    value = aws_subnet.subnet2.cidr_block
}

output "subnet_cidr" {
    value = aws_subnet.subnet3.cidr_block
}

output "subnet_cidr" {
    value = aws_subnet.subnet4.cidr_block
}