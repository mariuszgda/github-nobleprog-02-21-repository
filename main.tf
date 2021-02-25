

# provider definition

provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region
}

# random suffix

resource "random_string" "suffix" {
  length  = 4
  special = false
  lower   = true
  number  = false
  upper   = false
  # only letters and only small ones
}

resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    "Name" = "${var.team}-${var.infrastructure}-${random_string.suffix.id}-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    "Name" = "${var.team}-${var.infrastructure}-${random_string.suffix.id}-igw"
  }
}

resource "aws_subnet" "subnet_1" {
  cidr_block = var.subnet_1_cidr
  vpc_id     = aws_vpc.vpc.id
  tags = {
    "Name" = "${var.team}-${var.infrastructure}-${random_string.suffix.id}-subnet-1"
  }
}

resource "aws_subnet" "subnet_2" {
  cidr_block = var.subnet_2_cidr
  vpc_id     = aws_vpc.vpc.id
  tags = {
    "Name" = "${var.team}-${var.infrastructure}-${random_string.suffix.id}-subnet-2"
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    "Name" = "${var.team}-${var.infrastructure}-${random_string.suffix.id}-rt"
  }
}

resource "aws_route" "public" {
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
  route_table_id         = aws_route_table.rt.id
}

# associations

resource "aws_route_table_association" "sub1" {
  subnet_id      = aws_subnet.subnet_1.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_route_table_association" "sub2" {
  subnet_id      = aws_subnet.subnet_2.id
  route_table_id = aws_route_table.rt.id
}


# outputs
