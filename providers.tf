# Declare the required providers and versions
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS provider
provider "aws" {
  region                   = "us-east-1"          # Set the AWS region
  shared_credentials_files = ["~/.aws/creds"]      # Specify the shared credentials file path
  profile                  = "vscode"              # Use the specified AWS profile for authentication
}
