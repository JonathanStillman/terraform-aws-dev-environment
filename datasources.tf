# Query AWS for the most recent AMI that matches specified criteria
data "aws_ami" "server_ami" {
  most_recent = true                             # Retrieve the most recent AMI
  owners      = ["099720109477"]                 # Specify the AWS account ID that owns the AMI

  filter {
    name   = "name"                               # Apply a filter based on the AMI name
    values = [ "ubuntu/images/hvm-ssd/ubuntu-bionic-10.04-amd64-server-*" ]  # Specify the pattern for the AMI name
  }
}
