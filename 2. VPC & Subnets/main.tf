provider "aws" {
    region = "ap-south-1"
}

resource "aws_vpc" "first-vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
      "Name" = "production"
    }
}
resource "aws_vpc" "second-vpc" {
    cidr_block = "10.1.0.0/16"
}

resource "aws_subnet" "subnet-1" {
    vpc_id = aws_vpc.second-vpc.id
    cidr_block = "10.1.1.0/24"

    tags = {
        "Name": "prod-subnet-1"
    }
}