# provider
provider "aws" {
    region = "ap-south-1"
}

# public vpc
resource "aws_vpc" "public-vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
      "Name" = "production-public-vpc"
    }
}

# internet gateway for public access
resource "aws_internet_gateway" "production-ig" {
    vpc_id = aws_vpc.public-vpc.id
    tags = {
      "Name" = "production-ig"
    }
}

# add public route to default route table for vpc
resource "aws_default_route_table" "public-vpc-route-table" {
    default_route_table_id = aws_vpc.public-vpc.default_route_table_id
    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.production-ig.id
    } 
}

# public subnet in public vpc
resource "aws_subnet" "production-public-subnet" {
    vpc_id = aws_vpc.public-vpc.id
    cidr_block = "10.0.0.0/16"
    map_public_ip_on_launch = true
    tags = {
      "Name" = "production-public-subnet"
    }
}

