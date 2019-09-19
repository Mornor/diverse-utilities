resource "aws_vpc" "main" {
  cidr_block = var.main_vpc_cidr_block
  tags = {
    Name = "Main VPC"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_cidr_block

  tags = {
    Name = "Private Subnet"
  }
}

