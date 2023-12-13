terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Shared Configuration and Credentials Files
provider "aws" {
  region                   = "us-east-1"
  shared_credentials_files = ["~/.aws/creds"]
  profile                  = "vscode"
}
