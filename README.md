# AWS Infrastructure with Terraform
Automate AWS infrastructure with Terraform to build a robust development environment. Streamline deployment, configuration, and management for efficient and scalable workflows.
<img width="1429" alt="ExampleImage" src="https://github.com/JonathanStillman/terraform-aws-dev-environment/assets/68572893/3cebdfe1-f809-4d80-ba8d-e668b7d693b4">

This Terraform configuration sets up a basic AWS infrastructure consisting of a Virtual Private Cloud (VPC), a public subnet, an Internet Gateway, a Route Table, a Security Group, and an EC2 instance.

## Components:

### VPC (aws_vpc.mtc_vpc)
- Name: dev
- IP Address Range: 10.123.0.0/16
- DNS Hostnames enabled
- DNS Support enabled

### Subnet (aws_subnet.mtc_public_subnet)
- Name: dev-public
- IP Address Range: 10.123.1.0/24
- Map public IP addresses on launch
- Availability Zone: us-east-1a

### Internet Gateway (aws_internet_gateway.mtc_internet_gateway)
- Name: dev-igw
- Attached to VPC: dev

### Route Table (aws_route_table.mtc_public_rt)
- Name: dev-public-rt
- Associated with VPC: dev

### Route (aws_route.default_route)
- Default route to Internet Gateway for Internet-bound traffic

### Route Table Association (aws_route_table_association.mtc_public_assoc)
- Associates the public subnet with the public route table

### Security Group (aws_security_group.mtc_public_sg)
- Name: dev-sg
- Description: dev security group
- Ingress Rules:
  - Allow traffic from any port and a specific IP
- Egress Rule:
  - Allow traffic to any IP

### Key Pair (aws_key_pair.mtc_auth)
- Name: mtckey
- Public Key: Your public key file

### EC2 Instance (aws_instance.dev_node)
- Instance Type: t2.micro
- AMI: Ubuntu (AMI ID retrieved dynamically)
- Key Pair: mtckey
- Security Group: dev-sg
- Subnet: dev-public
- User Data Script: userdata.tpl
- Root Volume Size: 10 GB
- Local script executed after provisioning to configure SSH: linux-ssh-config.tpl

## Usage:

1. Make sure you have the necessary AWS credentials and Terraform installed.
2. Clone this repository.
3. Customize your public key file path in the `userdata.tpl` file.
4. Run `terraform init` to initialize the Terraform configuration.
5. Run `terraform apply` to create the AWS resources.

Feel free to modify the variables and scripts as needed for your specific use case.

For questions or issues, please contact [Your Contact Information].

**Note:** Ensure that sensitive information such as AWS credentials and private keys are handled securely and not exposed in the repository. Consider using environment variables or other secure methods for managing sensitive information.
