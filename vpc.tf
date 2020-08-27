resource "aws_vpc" "bemol_swarm_vpc" {
  cidr_block       = "10.1.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  
  tags = {
    Name = "bemol-swarm-vpc"
  }
}

#Create Internet gateway
resource "aws_internet_gateway" "bemol_internet_gw" {
  vpc_id = aws_vpc.bemol_swarm_vpc.id

  tags = {
    Name = "bemol-swarm-gw"
  }
}

# Subnets: public
resource "aws_subnet" "bemol_public_subnet" {
  vpc_id                  =  aws_vpc.bemol_swarm_vpc.id
  cidr_block              = "10.1.0.0/24"
  map_public_ip_on_launch = "true"
  
  tags = {
    Name = "bemol-swarm-subnet"
  }
}

#Create Public Route
resource "aws_route_table" "bemol_public_swarm_rt" {
  vpc_id = aws_vpc.bemol_swarm_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.bemol_internet_gw.id
  }

  tags = {
    Name = "bemol-swarm-rt"
  }
}


resource "aws_route_table_association" "bemol_subnet_rt_association" {
  subnet_id      = aws_subnet.bemol_public_subnet.id
  route_table_id = aws_route_table.bemol_public_swarm_rt.id
  depends_on     = [aws_route_table.bemol_public_swarm_rt, aws_subnet.bemol_public_subnet]
}