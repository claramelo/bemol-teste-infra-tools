variable "cluster_swarm_public_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDfYefMSZeHKX+I7LCWZbx6Y14SBW58lzIXyoVVEi90Zea1zWSjnyq3RnZ/KMzjDD1Xfiton5oWFaD0UcwzBZ9w1IuctrzPfMToaozRgyEvOoIKCAV5f9UPg8hHb6uvFdGKLzbFcrZjuIazltmONnaGDgWkXejh27LGF5feIGWJoPEMPGVED21nhJsB5tm7VK8Fkd1cjwKycxFg4+zA/wGvOprM7P56EzEUI7n0Xg7oCknH8n4V0OCVJAHckowVkhNuFLLO0MSsBuY+OwJqkl8b6XTpXXv3knZxr+hCWLSe/lw4dEHmp9b7hy122pcHKGscAIckioAqmKolBWgmH82v"
}

resource "aws_key_pair" "cluster_swarm_key" {
  key_name   = "cluster_swarm_key"
  public_key = var.cluster_swarm_public_key
}

resource "aws_instance" "bemol_swarm_leader" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = aws_key_pair.cluster_swarm_key.id
  user_data              = file(var.bootstrap_path)
  vpc_security_group_ids = [aws_security_group.bemol_swarm_sg.id]
  subnet_id              = aws_subnet.bemol_public_subnet.id

  tags = {
    Name  = "bemol-swarm-master"
  }
}

resource "aws_instance" "bemol_swarm_workers" {
  count                  = var.nodes_number
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = aws_key_pair.cluster_swarm_key.id
  user_data              = file(var.bootstrap_path)
  vpc_security_group_ids = [aws_security_group.bemol_swarm_sg.id, aws_security_group.swarm_node_sg.id]
  subnet_id              = aws_subnet.bemol_public_subnet.id

  tags = {
    Name  = "bemol-swarm-worker-${count.index + 1}"
  }
}