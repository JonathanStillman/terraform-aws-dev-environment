# Define an AWS VPC (Virtual Private Cloud) named "mtc_vpc"
resource "aws_vpc" "mtc_vpc" {
  cidr_block = "10.123.0.0/16"          # Set the IP address range for the VPC
  enable_dns_hostnames = true          # Enable DNS hostnames for instances inside the VPC
  enable_dns_support = true            # Enable DNS support for the VPC

  tags = {
    Name = "dev"                        # Set a tag for the VPC with the key "Name" and value "dev"
  }
}

# Define an AWS Subnet named "mtc_public_subnet" within the VPC
resource "aws_subnet" "mtc_public_subnet" {
  vpc_id                  = aws_vpc.mtc_vpc.id     # Reference the ID of the created VPC
  cidr_block              = "10.123.1.0/24"        # Set the IP address range for the subnet
  map_public_ip_on_launch = true                   # Map public IP addresses to instances launched in this subnet
  availability_zone       = "us-east-1a"           # Specify the availability zone for the subnet

  tags = {
    Name = "dev-public"                           # Set a tag for the subnet with the key "Name" and value "dev-public"
  }
}
