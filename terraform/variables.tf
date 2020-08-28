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

variable "circle_ci_public_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDfYefMSZeHKX+I7LCWZbx6Y14SBW58lzIXyoVVEi90Zea1zWSjnyq3RnZ/KMzjDD1Xfiton5oWFaD0UcwzBZ9w1IuctrzPfMToaozRgyEvOoIKCAV5f9UPg8hHb6uvFdGKLzbFcrZjuIazltmONnaGDgWkXejh27LGF5feIGWJoPEMPGVED21nhJsB5tm7VK8Fkd1cjwKycxFg4+zA/wGvOprM7P56EzEUI7n0Xg7oCknH8n4V0OCVJAHckowVkhNuFLLO0MSsBuY+OwJqkl8b6XTpXXv3knZxr+hCWLSe/lw4dEHmp9b7hy122pcHKGscAIckioAqmKolBWgmH82v"
}

variable "deploy_swarm_public_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDm+lUACTyj8KilevwenaM6k+lOLyyu5ZFkixUCn5FJukIkCkX7jVQBt+v30YgVB2XrzZyEV7ZC6qFbryqAdpoS0D1iDB2XacBb7wMqPHE4CjemXVXp35We0j4Lc4dRAJpdJfi2VZuMNzopytpSvPo2WF4K5+4nS1C6wR1MGnzJhUmWRldEJpzv+Tn5czpemxk25mXMFNhcOX1YO1Boq62pBYCRTjDoR8ZwCDOnnCIt9WRIZHZZWPTebT2Ahun70WKGWV5LQuZIfO/zLDUith6wYE3N4VpFvMXNvy5GdJT3tWlpqo/ltuFUBA4lWABb/pjimhf3vGZA71BI4E+V/nEJ"
}