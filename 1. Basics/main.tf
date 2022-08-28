provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "ubuntu" {
    ami = "ami-06489866022e12a14"
    instance_type = "t2.micro"
    tags = {
      "Name" = "ubuntu-server"
    }
}