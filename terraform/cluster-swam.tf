resource "aws_key_pair" "deploy_swarm_key" {
  key_name   = "cluster_swarm_key"
  public_key = var.deploy_swarm_public_key
}

resource "aws_instance" "bemol_swarm_leader" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = aws_key_pair.deploy_swarm_key.id
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
  key_name               = aws_key_pair.deploy_swarm_key.id
  user_data              = file(var.bootstrap_path)
  vpc_security_group_ids = [aws_security_group.bemol_swarm_sg.id, aws_security_group.swarm_node_sg.id]
  subnet_id              = aws_subnet.bemol_public_subnet.id

  tags = {
    Name  = "bemol-swarm-worker-${count.index + 1}"
  }
}