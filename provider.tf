provider "aws" {
  region = var.aws_region
  version = "3.0"
}

terraform {
  backend "s3" {
    bucket = "bemol-infrastructure"
    key = "terraform.tfstate"
    region = "us-east-1"
  }
}