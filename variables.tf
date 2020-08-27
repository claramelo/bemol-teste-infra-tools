variable "aws_region" {
  description = "AWS region where swarm cluster will be setup"
  type = string
  default = "us-east-1"
}

variable "ami" {
  description = "Amazon Linux AMI"
  type = string
  default = "ami-0761dd91277e34178"
}

variable "instance_type" {
  description = "Instance type"
  type = string
  default = "t2.micro"
}

variable "public_key_path" {
  description = "Path to the public key"
  default = "id_rsa.pub"
}

variable "bootstrap_path" {
  description = "Script to install Docker Engine"
  default = "install-docker.sh"
}

variable "nodes_number" {
  description = "Number of nodes"
  type = number
  default = 2
}

