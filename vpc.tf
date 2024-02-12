# create VPC

resource "aws_vpc" "whipps-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    name = "whipps-vpc"
  }
}

# create Public Subnet
resource "aws_subnet" "whipps-public-sub-1" {
  vpc_id     = aws_vpc.whipps-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "whipps-public-sub-1"
  }
}

resource "aws_subnet" "whipps-public-sub-2" {
  vpc_id     = aws_vpc.whipps-vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "whipps-public-sub-2"
  }
}

# create Private Subnet
resource "aws_subnet" "whipps-private-sub-1" {
  vpc_id     = aws_vpc.whipps-vpc.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "whipps-private-sub-1"
  }
}

resource "aws_subnet" "whipps-private-sub-2" {
  vpc_id     = aws_vpc.whipps-vpc.id
  cidr_block = "10.0.4.0/24"

  tags = {
    Name = "whipps-private-sub-2"
  }
}

# create Public-Route Table
resource "aws_route_table" "whipps-Public-RT" {
  vpc_id = aws_vpc.whipps-vpc.id
  tags  = {
   Name  = "whipps-Public-RT"
  }   
}

# create Private-Route Table
resource "aws_route_table" "whipps-Private-RT" {
  vpc_id = aws_vpc.whipps-vpc.id
  tags  = {
   Name  = "whipps-Private-RT"
  }   
}

# create Public-Route Table Association
resource "aws_route_table_association" "whipps-Public-route_table_association-1" {
  subnet_id      = aws_subnet.whipps-public-sub-1.id
  route_table_id = aws_route_table.whipps-Public-RT.id
}

resource "aws_route_table_association" "whipps-public-route_table_association-2" {
  subnet_id      = aws_subnet.whipps-public-sub-2.id
  route_table_id = aws_route_table.whipps-Public-RT.id
}

# create Private-Route Table Association
resource "aws_route_table_association" "whipps-private-route_table_association-3" {
  subnet_id      = aws_subnet.whipps-private-sub-1.id
  route_table_id = aws_route_table.whipps-Private-RT.id
}

resource "aws_route_table_association" "whipps-private-route_table_association-4" {
  subnet_id      = aws_subnet.whipps-private-sub-2.id
  route_table_id = aws_route_table.whipps-Private-RT.id
}

# create whipps-IGW
resource "aws_internet_gateway" "whipps-IGW" {
  vpc_id = aws_vpc.whipps-vpc.id

  tags = {
    Name = "whipps-IGW"
  }
}

# Create IGW Route
resource "aws_route" "whipps-Route" {
  route_table_id            = aws_route_table.whipps-Public-RT.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.whipps-IGW.id
}