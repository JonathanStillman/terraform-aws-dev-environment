# Define an AWS VPC (Virtual Private Cloud) named "mtc_vpc"
resource "aws_vpc" "mtc_vpc" {
  cidr_block           = "10.123.0.0/16" # Set the IP address range for the VPC
  enable_dns_hostnames = true            # Enable DNS hostnames for instances inside the VPC
  enable_dns_support   = true            # Enable DNS support for the VPC

  tags = {
    Name = "dev" # Set a tag for the VPC with the key "Name" and value "dev"
  }
}

# Define an AWS Subnet named "mtc_public_subnet" within the VPC
resource "aws_subnet" "mtc_public_subnet" {
  vpc_id                  = aws_vpc.mtc_vpc.id # Reference the ID of the created VPC
  cidr_block              = "10.123.1.0/24"    # Set the IP address range for the subnet
  map_public_ip_on_launch = true               # Map public IP addresses to instances launched in this subnet
  availability_zone       = "us-east-1a"       # Specify the availability zone for the subnet

  tags = {
    Name = "dev-public" # Set a tag for the subnet with the key "Name" and value "dev-public"
  }
}

# Define an AWS Internet Gateway named "mtc_internet_gateway"
resource "aws_internet_gateway" "mtc_internet_gateway" {
  vpc_id = aws_vpc.mtc_vpc.id # Attach the Internet Gateway to the specified VPC

  tags = {
    Name = "dev-igw" # Set a tag for the Internet Gateway with the key "Name" and value "dev-igw"
  }
}

# Define an AWS Route Table named "mtc_public_rt"
resource "aws_route_table" "mtc_public_rt" {
  vpc_id = aws_vpc.mtc_vpc.id # Associate the Route Table with the specified VPC

  tags = {
    Name = "dev-public-rt" # Set a tag for the Route Table with the key "Name" and value "dev-public-rt"
  }
}

# Define a default route in the Route Table to route traffic to the Internet Gateway
resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.mtc_public_rt.id             # Reference the ID of the created Route Table
  destination_cidr_block = "0.0.0.0/0"                                  # Set the destination CIDR block for the default route
  gateway_id             = aws_internet_gateway.mtc_internet_gateway.id # Specify the Internet Gateway ID for routing Internet-bound traffic
}

# Associate the previously created Route Table with the public subnet
resource "aws_route_table_association" "mtc_public_assoc" {
  subnet_id      = aws_subnet.mtc_public_subnet.id     # Specify the ID of the public subnet
  route_table_id = aws_route_table.mtc_public_rt.id    # Specify the ID of the associated Route Table
}

